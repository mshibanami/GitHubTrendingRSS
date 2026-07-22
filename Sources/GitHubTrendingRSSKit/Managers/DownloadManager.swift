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

    private let session: URLSession
    private let requestSemaphore: AsyncSemaphore

    public init(maxConcurrentRequests: Int = 8, session: URLSession = .shared) {
        requestSemaphore = AsyncSemaphore(limit: maxConcurrentRequests)
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

        NSLog("-> \(request.httpMethod ?? "???"): \(url.absoluteString)")

        var currentRetryCount = 0
        while true {
            do {
                return try await requestSemaphore.withPermit {
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
                        let rateLimitRemainingKey = "X-RateLimit-Remaining"
                        let remaining = httpResponse.value(forHTTPHeaderField: rateLimitRemainingKey) ?? "-"
                        let statusCode = httpResponse.statusCode
                        NSLog("<- \(statusCode) \(url.absoluteString) [\(rateLimitRemainingKey): \(remaining)]")
                        throw Error.failedFetching(statusCode: httpResponse.statusCode)
                    }
                }
            } catch {
                if currentRetryCount >= maxRetryCount {
                    throw error
                }

                if let err = error as? Error, case let .failedFetching(statusCode) = err {
                    if ![429, 403, 502].contains(statusCode) {
                        throw error
                    }
                }

                currentRetryCount += 1
                try await Task.sleep(nanoseconds: UInt64(retryInterval * 1_000_000_000))
            }
        }
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
