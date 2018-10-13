// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public extension Repository {
    public func feedEntryHTML() -> String {
        let url = pageLink.url
        return """
            <entry>
                <id>\(url)</id>
                <title>\(pageLink.userName)/\(pageLink.repositoryName)</title>
                <link>\(url)</link>
                <summary>\(summary.xmlEscaped)</summary>
            </entry>
            """
    }
}

public extension Array where Element == Repository {
    public func feedHTML(ofLanguage language: LanguageTrendingLink, period: Period) -> String {
        let entriesString = reduce("") {
            $0 + $1.feedEntryHTML()
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let nowString = formatter.string(from: Date())

        let feedURL = Const.rssHomeURL
          .appendingPathComponent(period.rawValue)
          .appendingPathComponent("\(language.name).xml")
          .absoluteString
      
        let feed = """
            <?xml version="1.0" encoding="UTF-8"?>
            <feed xmlns="http://www.w3.org/2005/Atom" xml:lang="en">
                <id>\(feedURL)</id>
                <title>GitHub Trending \(language.displayName)</title>
                <updated>\(nowString)</updated>
                <link rel="alternate" type="text/html" href="\(feedURL)" />
                <link rel="self" type="application/atom+xml" href="\(feedURL)" />
                \(entriesString)
            </feed>
            """

        return feed
    }
}
