// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct LanguageTrendingLink: PageLinkable {
    public var displayName: String
    public var href: String

    public var name: String {
        guard href != Const.gitHubTopTrendingURL.path else {
            return "all"
        }

        let url = URL(string: href)
        return url!.lastPathComponent
    }

    public init(displayName: String, href: String) {
        self.displayName = displayName
        self.href = href
    }
}
