// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import Combine

public class DownloadManager {
    var maxRetryCount = 10
    var retryInterval: TimeInterval = 2 * 60
    
    public init() {}
    
    public func fetchWebPage(url: URL, header: [String: String] = [:]) -> AnyPublisher<String, Error> {
        return Result.Publisher(())
            .flatMap({ _ -> AnyPublisher<String, Error> in
                let session = URLSession.shared
                
                let urlForDisplay = "\(url.host ?? "")\(url.path)"
                
                var request = URLRequest(url: url)
                for keyValue in header {
                    request.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
                }
                NSLog("-> \(request.httpMethod ?? "???"): \(urlForDisplay)")
                let dataTaskPublisher =  session.dataTaskPublisher(for: request)
                    .mapError { $0 as Error }
                    .tryMap({ data, response -> String in
                        guard let response = response as? HTTPURLResponse else {
                            throw DownloadError.unsupportedFormat
                        }
                        if response.statusCode == 200 {
                            guard let htmlResponse = String(data: data, encoding: .utf8) else {
                                assertionFailure()
                                throw DownloadError.unknown
                            }
                            return htmlResponse
                        } else {
                            let remaining = response.allHeaderFields["X-RateLimit-Remaining"] ?? "-"
                            NSLog("<- \(response.statusCode) \(urlForDisplay) [RateLimit-Remaining: \(remaining)]")
                            switch response.statusCode {
                            case 429, 403, 502:
                                throw DownloadError.unknown
                            default:
                                throw DownloadError.unknownUnreplyable
                            }
                        }
                    })
                return dataTaskPublisher.tryCatch { error -> AnyPublisher<String, Error> in
                    switch error {
                    case DownloadError.unknownUnreplyable:
                        throw error
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
