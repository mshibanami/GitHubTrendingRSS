// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import SwiftSoup

public class GitHubPageParser {

    private static let specialLinks = [
        LanguageTrendingLink(displayName: "All Languages", href: Const.gitHubTopTrendingURL.path),
        LanguageTrendingLink(displayName: "Unknown Languages", href: "/trending/unknown")]

    public init() {}

    public func periodSpecifiedTrendingPageLinks(fromTopTrendingPage topTrendingPage: String) throws -> [PageLink] {
        let parsed = try SwiftSoup.parse(topTrendingPage)
        let selectMenuLists = try parsed.select("div.select-menu-list").array()

        guard selectMenuLists.count == 2 else {
            throw RSSError.unsupportedFormat
        }

        let languagesList = selectMenuLists.first

        guard let linkHrefTags = (try? languagesList?.select("a[href]"))??.array() else {
            throw RSSError.unsupportedFormat
        }

        let links = linkHrefTags.compactMap { link -> PageLink? in
            guard let href = try? link.text() else {
                return nil
            }
            return PageLink(href: href)
        }
        return links
    }

    public func languageTrendingLinks(fromTopTrendingPage topTrendingPage: String) throws -> [LanguageTrendingLink] {
        let parsed = try SwiftSoup.parse(topTrendingPage)

        let selectMenuLists = (try? parsed.select("div.select-menu-list"))?.array() ?? []

        guard selectMenuLists.count == 2 else {
            throw RSSError.unsupportedFormat
        }

        let languagesList = selectMenuLists[1]
        let linkTags = (try? languagesList.select("a"))?.array() ?? []

        let links = GitHubPageParser.specialLinks + linkTags.compactMap { link -> LanguageTrendingLink? in
            guard let title = link.trimmedText,
                let href = try? link.attr("href") else {
                    return nil
            }
            return LanguageTrendingLink(
                displayName: title,
                href: href)
        }
        return links
    }
}
