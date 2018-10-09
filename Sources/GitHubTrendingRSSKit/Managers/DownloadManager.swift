// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public class DownloadManager {
    public init() {}

    public func fetchWebPage(url: URL, header: [String: String] = [:], completion: @escaping (String?, Error?) -> Void) {
        let session = URLSession.shared

        var request = URLRequest(url: url)
        for keyValue in header {
            request.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
        }

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil, error)
                return
            }

            guard let data = data,
                let response = response as? HTTPURLResponse else {
                    print("no data or no response")
                    completion(nil, NSError())
                    return
            }

            if response.statusCode == 200 {
                let htmlResponse = String(data: data, encoding: .utf8)
                completion(htmlResponse, nil)
                return
            } else {
                print("    Failed (statusCode: \(response.statusCode))")
                completion(nil, NSError())
                return
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
