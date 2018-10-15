// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import Kanna

public class GitHubPageParser {

    private static let specialLinks = [
        LanguageTrendingLink(displayName: "All Languages", href: Const.gitHubTopTrendingURL.path),
        LanguageTrendingLink(displayName: "Unknown Languages", href: "/trending/unknown")]

    public init() {}

    public func periodSpecifiedTrendingPageLinks(fromTopTrendingPage topTrendingPage: String) throws -> [PageLink] {
        let parsed = try HTML(html: topTrendingPage, encoding: .utf8)
        let selectMenuLists = parsed.css("div.select-menu-list")

        guard selectMenuLists.count == 2 else {
            throw RSSError.unsupportedFormat
        }

        let languagesList = selectMenuLists.first

        guard let linkHrefTags = languagesList?.css("a[href]") else {
            throw RSSError.unsupportedFormat
        }

        let links = linkHrefTags.compactMap { link -> PageLink? in
            guard let href = link.text else {
                return nil
            }
            return PageLink(href: href)
        }
        return links
    }

    public func languageTrendingLinks(fromTopTrendingPage topTrendingPage: String) throws -> [LanguageTrendingLink] {
        let parsed = try HTML(html: topTrendingPage, encoding: .utf8)

        let selectMenuLists = parsed.css("div.select-menu-list")

        guard selectMenuLists.count == 2 else {
            throw RSSError.unsupportedFormat
        }

        let languagesList = selectMenuLists[1]
        let linkTags = languagesList.css("a")

        let links = GitHubPageParser.specialLinks + linkTags.compactMap { link -> LanguageTrendingLink? in
                guard let title = link.trimmedText,
                    let href = link["href"] else {
                        return nil
                }
                return LanguageTrendingLink(
                    displayName: title,
                    href: href)
        }

        return links
    }

}
