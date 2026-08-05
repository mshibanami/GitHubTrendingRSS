// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct LanguageTrendingLink: PageLinkable, Sendable {
    public var displayName: String
    public var href: String

    public var name: String {
        guard href != Const.gitHubTopTrendingURL.path else {
            return "all"
        }
        return URL(string: href)!.lastPathComponent
    }

    public init(displayName: String, href: String) {
        self.displayName = displayName
        self.href = href
    }

    public func developerURL(ofPeriod period: Period) -> URL {
        let path: String
        if href == Const.gitHubTopTrendingURL.path {
            path = "/trending/developers"
        } else {
            let language = URL(string: href)!.lastPathComponent
            path = "/trending/developers/\(language)"
        }

        var components = URLComponents(
            url: Const.gitHubBaseURL,
            resolvingAgainstBaseURL: false
        )!

        components.path = path
        components.queryItems = [
            URLQueryItem(name: "since", value: period.rawValue),
        ]

        return components.url!
    }
}
