// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import Kanna
import Markin
import PerfectMarkdown

public extension Repository {
    public func createFeedEntryHTML() -> String {
        let url = pageLink.url
        return """
            <item>
                <title>\(pageLink.userName)/\(pageLink.repositoryName)</title>
                <link>\(url)</link>
                <description>\(createFeedDescriptionHTML().xmlEscaped)</description>
            </item>
            """
    }

    public func createFeedDescriptionHTML() -> String {
        let imageHTML: String
        if let imageURLString = imageURLs().first?.absoluteString {
            imageHTML = "<img src='\(imageURLString)'><br>"
        } else {
            imageHTML = ""
        }
        return imageHTML + summary
    }

    public func imageURLs() -> [URL] {
        var imageURLs = [URL]()
        if var readMe = readMe,
            let readMeContent = readMe.content,
            let readMeHTML = readMeContent.markdownToHTML,
            let parsedHTML = try? HTML(html: readMeHTML, encoding: .utf8) {
            imageURLs = parsedHTML.css("img").compactMap { img -> URL? in
                guard let src = img["src"] else {
                    return nil
                }

                let relativeURL: URL?
                if let downloadURL = readMe.downloadURL {
                    relativeURL = URL(string: downloadURL)
                } else {
                    relativeURL = nil
                }
                return URL(string: src, relativeTo: relativeURL)
            }
        }
        return imageURLs
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
