// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public protocol PageLinkable: Hashable {
    var href: String { get set }
}

public extension PageLinkable {
    func url(ofPeriod period: Period, spokenLanguage: SpokenLanguage = .unspecified) -> URL {
        let path = URL(string: href)!.path

        var components = URLComponents(
            url: Const.gitHubBaseURL,
            resolvingAgainstBaseURL: false
        )!

        components.path = path
        var queryItems = [
            URLQueryItem(name: "since", value: period.rawValue),
        ]
        if let code = spokenLanguage.code {
            queryItems.append(URLQueryItem(name: "spoken_language_code", value: code))
        }
        components.queryItems = queryItems

        return components.url!
    }
}
