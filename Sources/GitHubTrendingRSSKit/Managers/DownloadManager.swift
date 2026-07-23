// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public final class DownloadManager: @unchecked Sendable {
    public enum Error: Swift.Error, Equatable {
        case unknown
        case failedFetching(statusCode: Int)
        case brokenResponseData
        case invalidURL
        case unsupportedFormat
    }

    var maxRetryCount = 10
    var retryInterval: TimeInterval = 2 * 60

    static let maxCooldownInterval: TimeInterval = 15 * 60

    private let session: URLSession
    private let gateRegistry: HostRequestGateRegistry

    public init(
        maxConcurrentRequests: Int = 8,
        maxConcurrentRequestsByHost: [String: Int] = [:],
        minRequestIntervalByHost: [String: TimeInterval] = [:],
        session: URLSession = .shared
    ) {
        gateRegistry = HostRequestGateRegistry(
            defaultLimit: maxConcurrentRequests,
            limitsByHost: maxConcurrentRequestsByHost,
            minRequestIntervalsByHost: minRequestIntervalByHost
        )
        self.session = session
    }

    public func fetch(
        url: URL,
        httpMethod: String = "GET",
        httpBody: Data? = nil,
        header: [String: String] = [:],
        basicAuthInfo: BasicAuthInfo? = nil,
        bearerToken: String? = nil
    ) async throws -> String {
        let request = makeRequest(
            url: url,
            httpMethod: httpMethod,
            httpBody: httpBody,
            header: header,
            authorization: Self.makeAuthorizationHeaderValue(basicAuthInfo: basicAuthInfo, bearerToken: bearerToken)
        )

        let gate = await gateRegistry.gate(forHost: url.host ?? "")
        var currentRetryCount = 0
        while true {
            do {
                return try await gate.semaphore.withPermit {
                    try await gate.cooldown.waitUntilReady()
                    try await gate.pacer?.waitTurn()
                    return try await performRequest(request, gate: gate)
                }
            } catch {
                if currentRetryCount >= maxRetryCount {
                    NSLog("🛑 Giving up after \(currentRetryCount) retries: \(url.absoluteString)")
                    throw error
                }

                var shouldSleepFixedInterval = true
                if let err = error as? Error, case let .failedFetching(statusCode) = err {
                    if ![429, 403, 502].contains(statusCode) {
                        throw error
                    }
                    shouldSleepFixedInterval = statusCode == 502
                }

                currentRetryCount += 1
                NSLog("🔁 Will retry (\(currentRetryCount)/\(maxRetryCount)): \(url.absoluteString)")
                if shouldSleepFixedInterval {
                    try await Task.sleep(nanoseconds: UInt64(retryInterval * 1_000_000_000))
                }
            }
        }
    }

    private func performRequest(_ request: URLRequest, gate: HostRequestGate) async throws -> String {
        let url = request.url!
        NSLog("-> \(request.httpMethod ?? "???"): \(url.absoluteString)")
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw Error.unsupportedFormat
        }

        if httpResponse.statusCode == 200 {
            guard let htmlResponse = String(data: data, encoding: .utf8) else {
                assertionFailure()
                throw Error.brokenResponseData
            }
            return htmlResponse
        } else {
            let statusCode = httpResponse.statusCode
            let rateLimitRemainingKey = "X-RateLimit-Remaining"
            let remaining = httpResponse.value(forHTTPHeaderField: rateLimitRemainingKey) ?? "-"
            NSLog("<- \(statusCode) \(url.absoluteString) [\(rateLimitRemainingKey): \(remaining)]")

            if [429, 403].contains(statusCode) {
                let cooldown = Self.retryAfterInterval(from: httpResponse) ?? retryInterval
                NSLog("⏸ Rate limited: pausing requests to \(url.host ?? "?") for \(Int(cooldown))s")
                await gate.cooldown.beginCooldown(for: cooldown)
            }
            throw Error.failedFetching(statusCode: statusCode)
        }
    }

    static func retryAfterInterval(from response: HTTPURLResponse) -> TimeInterval? {
        if let retryAfter = response.value(forHTTPHeaderField: "Retry-After"),
           let seconds = TimeInterval(retryAfter), seconds > 0 {
            return min(seconds, maxCooldownInterval)
        }
        if let reset = response.value(forHTTPHeaderField: "X-RateLimit-Reset"),
           let epoch = TimeInterval(reset) {
            let interval = epoch - Date().timeIntervalSince1970
            if interval > 0 {
                return min(interval, maxCooldownInterval)
            }
        }
        return nil
    }

    private func makeRequest(
        url: URL,
        httpMethod: String,
        httpBody: Data?,
        header: [String: String],
        authorization: String?
    ) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.httpBody = httpBody
        for keyValue in header {
            request.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
        }
        if let authorization {
            request.addValue(authorization, forHTTPHeaderField: "Authorization")
        }
        return request
    }

    private static func makeAuthorizationHeaderValue(basicAuthInfo: BasicAuthInfo?, bearerToken: String?) -> String? {
        if let basicAuthInfo {
            return basicAuthInfo.makeHeaderValue()
        } else if let bearerToken, !bearerToken.isEmpty {
            return "bearer \(bearerToken)"
        }
        return nil
    }
}

public struct BasicAuthInfo {
    public let userName: String
    public let password: String

    public init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }

    func makeHeaderValue() -> String {
        let credential = Data("\(userName):\(password)".utf8).base64EncodedString(options: [])
        return "Basic \(credential)"
    }
}
