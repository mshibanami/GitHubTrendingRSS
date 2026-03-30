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

    public init() {}

    public func fetch(
        url: URL,
        httpMethod: String = "GET",
        httpBody: Data? = nil,
        header: [String: String] = [:],
        basicAuthInfo: BasicAuthInfo? = nil,
        bearerToken: String? = nil
    ) async throws -> String {
        let session = URLSession.shared

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.httpBody = httpBody
        for keyValue in header {
            request.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
        }
        
        if let basicAuthInfo = try basicAuthInfo?.makeHeaderValue() {
            request.addValue(basicAuthInfo, forHTTPHeaderField: "Authorization")
        } else if let bearerToken, !bearerToken.isEmpty {
            request.addValue("bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        }

        NSLog("-> \(request.httpMethod ?? "???"): \(url.absoluteString)")

        var currentRetryCount = 0
        while true {
            do {
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
                    NSLog("<- \(httpResponse.statusCode) \(url.absoluteString) [\(rateLimitRemainingKey): \(remaining)]")
                    throw Error.failedFetching(statusCode: httpResponse.statusCode)
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
}

public struct BasicAuthInfo {
    public enum Error: Swift.Error {
        case invalidUserNameOrPassword
    }

    public let userName: String
    public let password: String

    public init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }

    func makeHeaderValue() throws -> String {
        guard let credentialData = "\(userName):\(password)".data(using: String.Encoding.utf8) else {
            throw Error.invalidUserNameOrPassword
        }
        let credential = credentialData.base64EncodedString(options: [])
        return "Basic \(credential)"
    }
}
