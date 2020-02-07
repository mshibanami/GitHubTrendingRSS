// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import SwiftSoup

public class GitHubPageParser {

    private static let specialLinks = [
        LanguageTrendingLink(displayName: "All Languages", href: Const.gitHubTopTrendingURL.path),
        LanguageTrendingLink(displayName: "Unknown Languages", href: "/trending/unknown")]

    public init() {}

    public func languageTrendingLinks(fromTopTrendingPage topTrendingPage: String) throws -> [LanguageTrendingLink] {
        let parsed = try SwiftSoup.parse(topTrendingPage)
        
        let selectMenuLists = (try? parsed.select("div.select-menu-list"))?.array() ?? []
        
        guard let languagesList = selectMenuLists.first(where: { $0.id() == "languages-menuitems" }),
            let linkTags = (try? languagesList.select("a"))?.array() else {
                throw RSSError.unsupportedFormat
        }

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

    public func repositories(fromTrendingPage trendingPage: String) throws -> [Repository] {
        guard let parsed = try? SwiftSoup.parse(trendingPage) else {
            throw RSSError.unsupportedFormat
        }

        let repositoryArticleList = try parsed.select("article")
        var repositories = [Repository]()

        for li in repositoryArticleList {
            guard let titleATag = try? li.select("h1 > a"),
                let summaryPTag = try? li.select("p") else {
                    continue
            }

            guard let summary = summaryPTag.trimmedText,
                let href = try? titleATag.attr("href") else {
                    continue
            }
            let repositoryPageLink = RepositoryPageLink(href: href)
            repositories.append(
                Repository(pageLink: repositoryPageLink,
                           summary: summary))
        }
        return repositories
    }
}
