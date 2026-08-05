// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Algorithms
import Foundation
import SwiftSoup

public final class GitHubPageParser: Sendable {
    private static let specialLinks = [
        LanguageTrendingLink(displayName: "All Languages", href: Const.gitHubTopTrendingURL.path),
    ]

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
                href: href
            )
        }
        
        return links.uniqued(on: \.name)
    }

    public func repositories(fromTrendingPage trendingPage: String) throws -> [Repository] {
        guard let parsed = try? SwiftSoup.parse(trendingPage) else {
            throw RSSError.unsupportedFormat
        }

        let repositoryArticleList = try parsed.select("article")
        var repositories = [Repository]()

        for li in repositoryArticleList {
            guard let titleATag = try? li.select("h2 > a"),
                  let summaryPTag = try? li.select("h2 ~ p") else {
                continue
            }

            guard let summary = summaryPTag.trimmedText,
                  let href = try? titleATag.attr("href") else {
                continue
            }
            let repositoryPageLink = RepositoryPageLink(href: href)
            repositories.append(
                Repository(
                    pageLink: repositoryPageLink,
                    summary: summary
                )
            )
        }
        return repositories
    }

    public func developers(fromTrendingPage trendingPage: String) throws -> [Developer] {
        guard let parsed = try? SwiftSoup.parse(trendingPage) else {
            throw RSSError.unsupportedFormat
        }

        let developerArticles = try parsed.select("article.Box-row")
        var developers = [Developer]()

        for article in developerArticles {
            let usernameTag = try? article.select("p.f4 a").first()
            var username = usernameTag?.trimmedText ?? ""

            let displayNameTag = try? article.select("h1.h3 a").first()
            let displayName = displayNameTag?.trimmedText ?? ""

            if username.isEmpty, let href = try? displayNameTag?.attr("href") {
                username = href.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
            }

            guard !username.isEmpty else {
                continue
            }

            let finalDisplayName = displayName.isEmpty ? username : displayName

            var avatarURL: URL?
            if let avatarSrc = try? article.select("img.avatar-user").attr("src"),
               !avatarSrc.isEmpty {
                avatarURL = URL(string: avatarSrc)
            }

            var popularRepository: DeveloperPopularRepository?
            if let popRepoArticle = try? article.select("article").first(),
               let popRepoATag = try? popRepoArticle.select("h1.h4 a").first(),
               let popRepoHref = try? popRepoATag.attr("href"), !popRepoHref.isEmpty {
                let repoName: String
                if let text = popRepoATag.trimmedText, !text.isEmpty {
                    repoName = text
                } else if let lastPathComponent = URL(string: popRepoHref)?.lastPathComponent, !lastPathComponent.isEmpty {
                    repoName = lastPathComponent
                } else {
                    repoName = popRepoHref
                }
                let popRepoSummary = try? popRepoArticle.select("div.f6.color-fg-muted.mt-1").first()?.trimmedText
                popularRepository = DeveloperPopularRepository(
                    name: repoName,
                    href: popRepoHref,
                    summary: (popRepoSummary?.isEmpty == false) ? popRepoSummary : nil
                )
            }

            let isSponsorable = (try? article.select("a[href*='/sponsors/']").first()) != nil

            developers.append(
                Developer(
                    username: username,
                    displayName: finalDisplayName,
                    avatarURL: avatarURL,
                    popularRepository: popularRepository,
                    isSponsorable: isSponsorable
                )
            )
        }

        return developers
    }
}
