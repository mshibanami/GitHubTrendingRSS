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
    
    public func fetchWebPage(url: URL, header: [String: String] = [:]) -> AnyPublisher<String, Swift.Error> {
        return Result.Publisher(())
            .flatMap({ _ -> AnyPublisher<String, Swift.Error> in
                let session = URLSession.shared
                
                let urlForDisplay = "\(url.host ?? "")\(url.path)"
                
                var request = URLRequest(url: url)
                for keyValue in header {
                    request.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
                }
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
