// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import RxSwift

public class DownloadManager {
    var maxRetryCount: Int = 10
    var retryInterval: Double = 60 * 5
    public init() {}
    
    public func fetchWebPage(url: URL, header: [String: String] = [:], retryCount: Int = 0) -> Single<String> {
        return Single<String>.create { observer in
            self.fetchWebPage(url: url, header: header, retryCount: retryCount) { response, error in
                if let error = error {
                    observer(.error(error))
                    return
                }
                guard let response = response else {
                    observer(.error(DownloadError.unknown))
                    return
                }
                observer(.success(response))
            }
            return Disposables.create()
        }
    }
    
    public func fetchWebPage(url: URL, header: [String: String] = [:], retryCount: Int = 0, completion: @escaping (String?, Error?) -> Void) {
        let session = URLSession.shared

        var request = URLRequest(url: url)
        for keyValue in header {
            request.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
        }

        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else {
                return
            }

            let retriesIfNeeded = { () -> Bool in
                if retryCount < self.maxRetryCount {
                    print("    Retry after \(self.retryInterval)s [\(retryCount)/\(self.maxRetryCount)]")
                    DispatchQueue.global().asyncAfter(deadline: .now() + self.retryInterval) {
                        self.fetchWebPage(
                            url: url,
                            header: header,
                            retryCount: retryCount + 1,
                            completion: completion)
                    }
                    return true
                }
                return false
            }

            if let error = error {
                print("    Error: \(error)")
                switch error {
                case URLError.notConnectedToInternet:
                    if retriesIfNeeded() { return }
                    fallthrough
                default:
                    completion(nil, error)
                    return
                }
            }
            
            guard let data = data else {
                completion(nil, DownloadError.noData)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(nil, DownloadError.noResponce)
                return
            }
            
            if response.statusCode == 200 {
                let htmlResponse = String(data: data, encoding: .utf8)
                completion(htmlResponse, nil)
                return
            } else {
                print("    Failed (statusCode: \(response.statusCode))")
                switch response.statusCode {
                case 429, 403:
                    if retriesIfNeeded() { return }
                    fallthrough
                default:
                    completion(nil, DownloadError.unknown)
                    return
                }
            }
        }

        print("Start fetching: \(url.host ?? "")\(url.path)")
        task.resume()
    }

    public func fetchWebPage(url: URL, header: [String: String] = [:]) -> String? {
        var htmlResponse: String?
        let semaphore = DispatchSemaphore(value: 0)

        fetchWebPage(url: url, header: header) { response, _ in
            htmlResponse = response
            semaphore.signal()
        }
        semaphore.wait()
        return htmlResponse
    }
}
