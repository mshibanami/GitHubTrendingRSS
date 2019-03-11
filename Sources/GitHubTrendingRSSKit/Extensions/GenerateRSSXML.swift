// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public extension Repository {
    public func feedEntryHTML() -> String {
        let url = pageLink.url
        return """
            <item>
                <title>\(pageLink.userName)/\(pageLink.repositoryName)</title>
                <link>\(url)</link>
                <description>\(summary.xmlEscaped)</description>
            </item>
            """
    }
}

public extension Array where Element == Repository {
    public func feedHTML(ofLanguage language: LanguageTrendingLink, period: Period) -> String {
        let entriesString = reduce("") {
            $0 + $1.feedEntryHTML()
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM YYYY HH:mm:ss 'GMT'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let pubDate = formatter.string(from: Date())

        let feed = """
            <?xml version="1.0" encoding="UTF-8"?>
            <rss version="2.0">
            <channel>
                <title>GitHub \(language.displayName) \(period.rawValue.capitalized) Trending</title>
                <description>\(period.rawValue.capitalized) Trending of \(language.displayName) in GitHub</description>
                <pubDate>\(pubDate)</pubDate>
                <link>\(Const.rssHomeURL.absoluteString)</link>
                \(entriesString)
            </channel>
            </rss>
            """

        return feed
    }
}
