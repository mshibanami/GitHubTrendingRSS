// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public class DownloadManager {
    var maxRetryCount: Int = 10
    var retryInterval: Double = 30

    public init() {}

    public func fetchWebPage(url: URL, header: [String: String] = [:], retryCount: Int = 0, completion: @escaping (String?, Error?) -> Void) {
        let session = URLSession.shared

        var request = URLRequest(url: url)
        for keyValue in header {
            request.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
        }

        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let `self` = self else {
                return
            }

            let retryOrNot = { () -> Bool in
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
                    if retryOrNot() { return }
                    fallthrough
                default:
                    completion(nil, error)
                    return
                }
            }

            guard let data = data,
                let response = response as? HTTPURLResponse else {
                    print("    Error: no data or no response")
                    completion(nil, NSError())
                    return
            }

            if response.statusCode == 200 {
                let htmlResponse = String(data: data, encoding: .utf8)
                completion(htmlResponse, nil)
                return
            } else {
                print("    Failed (statusCode: \(response.statusCode))")
                switch response.statusCode {
                case 429:
                    if retryOrNot() { return }
                    fallthrough
                default:
                    completion(nil, NSError())
                    return
                }
            }
        }

        print("Start fetching: \(url)")
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
