// Copyright (c) 2019 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import Stencil

public final class SiteSourceMaker: @unchecked Sendable {
    public struct Information {
        public let pageTitle: String
        public let author: String
        public let rssHomeURL: String
        public let googleAnalyticsTrackingCode: String
        public let gitHubRepositoryURL: String

        public init(pageTitle: String, author: String, rssHomeURL: String, googleAnalyticsTrackingCode: String, gitHubRepositoryURL: String) {
            self.pageTitle = pageTitle
            self.author = author
            self.rssHomeURL = rssHomeURL
            self.googleAnalyticsTrackingCode = googleAnalyticsTrackingCode
            self.gitHubRepositoryURL = gitHubRepositoryURL
        }
    }

    let information: Information
    let environment: Environment

    private let descriptionHTMLCache: AsyncCache<String, String?> = AsyncCache()

    public init(environment: Environment, information: Information) {
        self.environment = environment
        self.information = information
    }

    public func makeHomeHTML(from languageTrendingLinks: [LanguageTrendingLink]) throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let latestBuildDate = formatter.string(from: Date())
        let context: [String: Any] = [
            "information": information,
            "latestBuildDate": latestBuildDate,
            "languageTrendingLinks": languageTrendingLinks.map {
                (
                    link: $0,
                    urlEncodedName: $0.name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
                )
            },
            "periods": Period.allCases.map {
                (name: $0.rawValue, capitalizedName: $0.rawValue.capitalized)
            },
        ]

        return try environment.renderTemplate(
            name: "home_template.html",
            context: context
        )
    }

    public func makeRSS(from languageTrendingLink: LanguageTrendingLink, period: Period, spokenLanguage: SpokenLanguage = .unspecified, repositories: [Repository], supportedEmojis: [GitHubEmoji]) async throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM YYYY HH:mm:ss 'GMT'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let pubDate = formatter.string(from: Date())

        let noDescriptionHTML = #"<p style="color:#586069;"><em>No description/README provided.</em></p>"#

        var repositoryContexts: [(description: String, userID: String, repositoryName: String, url: String, pageLink: RepositoryPageLink, openGraphImageUrl: String?)] = []
        for repository in repositories {
            let cacheKey = "\(repository.pageLink.url.absoluteString)|hasReadMe:\(repository.readMe != nil)"
            let renderedHTML = try await descriptionHTMLCache.value(for: cacheKey) {
                try await repository.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)
            }
            let descriptionHTML = renderedHTML ?? noDescriptionHTML
            repositoryContexts.append((
                description: descriptionHTML.xml10Sanitized.xmlEscaped,
                userID: repository.pageLink.userID,
                repositoryName: repository.pageLink.repositoryName,
                url: repository.pageLink.url.absoluteString,
                pageLink: repository.pageLink,
                openGraphImageUrl: repository.openGraphImageUrl?.absoluteString.xmlEscaped
            ))
        }

        let context: [String: Any] = [
            "languageTrendingLink": languageTrendingLink,
            "spokenLanguage": spokenLanguage,
            "information": information,
            "periodText": period.rawValue.capitalized,
            "pubDate": pubDate,
            "repositories": repositoryContexts,
            "periods": Period.allCases.map(\.rawValue),
        ]

        return try environment.renderTemplate(
            name: "rss_template.xml",
            context: context
        )
    }

    public func makeDeveloperRSS(
        from languageTrendingLink: LanguageTrendingLink,
        period: Period,
        developers: [Developer],
        supportedEmojis: [GitHubEmoji]
    ) async throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM YYYY HH:mm:ss 'GMT'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let pubDate = formatter.string(from: Date())

        var developerContexts: [[String: Any]] = []
        for developer in developers {
            let popRepoHref = developer.popularRepository?.href ?? ""
            let cacheKey = "dev:\(developer.username)|pop:\(popRepoHref)|hasReadMe:\(developer.profileReadMe != nil)"
            let descriptionHTML = try await descriptionHTMLCache.value(for: cacheKey) {
                try await self.buildDeveloperDescriptionHTML(developer: developer, supportedEmojis: supportedEmojis)
            } ?? ""

            let title = developer.displayName != developer.username
                ? "\(developer.displayName) (\(developer.username))"
                : developer.username

            var devDict: [String: Any] = [
                "title": title.xml10Sanitized.xmlEscaped,
                "link": "https://github.com/\(developer.username)".xmlEscaped,
                "username": developer.username,
                "displayName": developer.displayName,
                "description": descriptionHTML.xml10Sanitized.xmlEscaped,
            ]
            if let avatarURL = developer.avatarURL {
                devDict["avatarURL"] = avatarURL.absoluteString.xmlEscaped
            }
            developerContexts.append(devDict)
        }

        let context: [String: Any] = [
            "languageTrendingLink": languageTrendingLink,
            "information": information,
            "periodText": period.rawValue.capitalized,
            "pubDate": pubDate,
            "developers": developerContexts,
            "periods": Period.allCases.map(\.rawValue),
        ]

        return try environment.renderTemplate(
            name: "developer_rss_template.xml",
            context: context
        )
    }

    private func buildDeveloperDescriptionHTML(developer: Developer, supportedEmojis: [GitHubEmoji]) async throws -> String {
        var html = ""

        if let avatarURL = developer.avatarURL {
            html += #"<p><img src="\#(avatarURL.absoluteString.xmlEscaped)" width="48" height="48" alt="@\#(developer.username.xmlEscaped)" style="border-radius: 50%; vertical-align: middle; margin-right: 8px;" /> "#
        } else {
            html += "<p>"
        }
        html += #"<strong><a href="https://github.com/\#(developer.username.xmlEscaped)">\#(developer.displayName.xmlEscaped)</a></strong> (\#(developer.username.xmlEscaped))</p>"#

        if let bio = developer.bio, !bio.isEmpty {
            html += "<p><em>\(bio.xmlEscaped)</em></p>"
        }

        if developer.isSponsorable {
            html += "<p>💖 <strong>Sponsorable</strong></p>"
        }

        var details = [String]()
        if let company = developer.company, !company.isEmpty {
            details.append("🏢 \(company.xmlEscaped)")
        }
        if let location = developer.location, !location.isEmpty {
            details.append("📍 \(location.xmlEscaped)")
        }
        if let followersCount = developer.followersCount {
            details.append("👥 \(followersCount) followers")
        }
        if let publicReposCount = developer.publicReposCount {
            details.append("📦 \(publicReposCount) repos")
        }
        if let websiteURL = developer.websiteURL {
            details.append("🔗 <a href=\"\(websiteURL.absoluteString.xmlEscaped)\">\(websiteURL.absoluteString.xmlEscaped)</a>")
        }
        if let twitterUsername = developer.twitterUsername, !twitterUsername.isEmpty {
            details.append("🐦 @\(twitterUsername.xmlEscaped)")
        }
        if !details.isEmpty {
            html += "<p>" + details.joined(separator: " | ") + "</p>"
        }

        if let popRepo = developer.popularRepository {
            let href: String
            if popRepo.href.hasPrefix("http://") || popRepo.href.hasPrefix("https://") {
                href = popRepo.href
            } else if popRepo.href.hasPrefix("/") {
                href = "https://github.com" + popRepo.href
            } else {
                href = "https://github.com/" + popRepo.href
            }
            html += "<h4>🔥 Popular Repository</h4><p><a href=\"\(href.xmlEscaped)\"><strong>\(popRepo.name.xmlEscaped)</strong></a>"
            if let summary = popRepo.summary, !summary.isEmpty {
                html += "<br>\(summary.xmlEscaped)"
            }
            html += "</p>"
        }

        if !developer.pinnedRepositories.isEmpty {
            html += "<h4>📌 Pinned Repositories</h4><ul>"
            for pinned in developer.pinnedRepositories {
                html += "<li><a href=\"\(pinned.url.absoluteString.xmlEscaped)\"><strong>\(pinned.name.xmlEscaped)</strong></a>"
                if let stars = pinned.stargazerCount {
                    html += " ⭐ \(stars)"
                }
                if let summary = pinned.summary, !summary.isEmpty {
                    html += "<br>\(summary.xmlEscaped)"
                }
                html += "</li>"
            }
            html += "</ul>"
        }

        if let profileReadMeHTML = try await developer.makeReadMeHTML(supportedEmojis: supportedEmojis) {
            html += "<hr>" + profileReadMeHTML
        }

        return html
    }
}
