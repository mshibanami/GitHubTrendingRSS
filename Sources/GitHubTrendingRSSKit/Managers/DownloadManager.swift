// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import Combine

public class DownloadManager {
    public enum Error: Swift.Error {
        case unknown
        case failedFetching(statusCode: Int)
        case brokenResponseData
        case invalidURL
        case unsupportedFormat
    }
    
    var maxRetryCount = 10
    var retryInterval: TimeInterval = 2 * 60
    
    public init() {}
    
    public func fetch(url: URL, header: [String: String] = [:], basicAuthInfo: BasicAuthInfo? = nil) -> AnyPublisher<String, Swift.Error> {
        return Result.Publisher(())
            .flatMap({ _ -> AnyPublisher<String, Swift.Error> in
                let session = URLSession.shared
                                
                var request = URLRequest(url: url)
                for keyValue in header {
                    request.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
                }
                do {
                    if let basicAuthInfo = try basicAuthInfo?.makeHeaderValue() {
                        request.addValue(basicAuthInfo, forHTTPHeaderField: "Authorization")
                    }
                } catch {
                    return Fail(error: error).eraseToAnyPublisher()
                }
                
                let urlForDisplay = "\(url.host ?? "")\(url.path)"
                NSLog("-> \(request.httpMethod ?? "???"): \(urlForDisplay)")
                let dataTaskPublisher =  session.dataTaskPublisher(for: request)
                    .mapError { $0 as Swift.Error }
                    .tryMap({ data, response -> String in
                        guard let response = response as? HTTPURLResponse else {
                            throw Error.unsupportedFormat
                        }
                        if response.statusCode == 200 {
                            guard let htmlResponse = String(data: data, encoding: .utf8) else {
                                assertionFailure()
                                throw Error.brokenResponseData
                            }
                            return htmlResponse
                        } else {
                            let rateLimitRemainingKey = "X-RateLimit-Remaining"
                            let remaining = response.allHeaderFields[rateLimitRemainingKey] ?? "-"
                            NSLog("<- \(response.statusCode) \(urlForDisplay) [\(rateLimitRemainingKey): \(remaining)]")
                            throw Error.failedFetching(statusCode: response.statusCode)
                        }
                    })
                
                return dataTaskPublisher.tryCatch { error -> AnyPublisher<String, Swift.Error> in
                    switch error {
                    case let Error.failedFetching(statusCode):
                        switch (statusCode) {
                        case 429, 403, 502:
                            break
                        default:
                            throw error
                        }
                        fallthrough
                    default:
                        return dataTaskPublisher
                            .delay(for: .init(floatLiteral: self.retryInterval), scheduler: DispatchQueue.global())
                            .eraseToAnyPublisher()
                    }
                }
                .eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
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
