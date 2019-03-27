// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import SwiftSoup
import PerfectMarkdown

public extension Repository {
    public func createFeedEntryHTML() -> String {
        let url = pageLink.url
        let description = readMeHTML() ?? summary
        return """
            <item>
                <title>\(pageLink.userName)/\(pageLink.repositoryName)</title>
                <link>\(url)</link>
                <description>\(description.xmlEscaped)</description>
            </item>
            """
    }

    public func readMeHTML() -> String? {
        if var readMe = readMe,
            let readMeContent = readMe.content,
            let readMeHTML = readMeContent.markdownToHTML,
            let parsedHTML = try? SwiftSoup.parse(readMeHTML) {
            
            if let downloadURL = readMe.downloadURL,
                let imgs = try? parsedHTML.getElementsByTag("img") {
                
                for img in imgs {
                    guard let url = try? img.attr("src"),
                        let baseURL = URL(string: downloadURL),
                        let absoluteURL = URL(string: url, relativeTo: baseURL)?.absoluteString else {
                            continue
                    }
                    _ = try? img.attr("src", absoluteURL)
                }
            }
            return (try? parsedHTML.body()?.html()) ?? nil
        }
        return nil
    }
}

public extension Array where Element == Repository {
    public func feedHTML(ofLanguage language: LanguageTrendingLink, period: Period) -> String {
        let entriesString = reduce("") {
            $0 + $1.createFeedEntryHTML()
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
