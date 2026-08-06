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
            let pinnedList = developer.pinnedRepositories.map(\.name).joined(separator: ",")
            let socialList = developer.socialAccounts.map { "\($0.provider):\($0.url.absoluteString)" }.joined(separator: ",")
            let cacheKey = "dev:\(developer.username)|pop:\(popRepoHref)|hasReadMe:\(developer.profileReadMe != nil)|pinned:\(pinnedList)|followers:\(developer.followersCount ?? -1)|company:\(developer.company ?? "")|bio:\(developer.bio ?? "")|tw:\(developer.twitterUsername ?? "")|web:\(developer.websiteURL?.absoluteString ?? "")|social:\(socialList)"
            let descriptionHTML = try await descriptionHTMLCache.value(for: cacheKey) {
                try await self.buildDeveloperDescriptionHTML(developer: developer, supportedEmojis: supportedEmojis)
            } ?? ""

            let title = developer.displayName != developer.username
                ? "\(developer.displayName) (@\(developer.username))"
                : "@\(developer.username)"

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

        let nameHTML: String
        if developer.displayName != developer.username {
            nameHTML = #"<strong><a href="https://github.com/\#(developer.username.xmlEscaped)">\#(developer.displayName.xmlEscaped)</a></strong><br><span style="color: #57606a;">@\#(developer.username.xmlEscaped)</span>"#
        } else {
            nameHTML = #"<strong><a href="https://github.com/\#(developer.username.xmlEscaped)">@\#(developer.username.xmlEscaped)</a></strong>"#
        }

        if let avatarURL = developer.avatarURL {
            html += #"<div style="display: flex; align-items: center; gap: 12px; margin-bottom: 12px;">"#
            html += #"<img src="\#(avatarURL.absoluteString.xmlEscaped)" width="48" height="48" alt="@\#(developer.username.xmlEscaped)" style="border-radius: 50%; flex-shrink: 0;" />"#
            html += "<div>\(nameHTML)</div></div>"
        } else {
            html += #"<div style="margin-bottom: 12px;">\(nameHTML)</div>"#
        }

        if let bio = developer.bio, !bio.isEmpty {
            html += "<p><em>\(bio.xmlEscaped.linkifyingGitHubMentions())</em></p>"
        }

        if developer.isSponsorable {
            html += "<p>💖 <strong>Sponsorable</strong></p>"
        }

        var details = [String]()
        if let company = developer.company, !company.isEmpty {
            details.append("🏢 \(company.xmlEscaped.linkifyingGitHubMentions())")
        }
        if let location = developer.location, !location.isEmpty {
            details.append("📍 \(location.xmlEscaped)")
        }
        if let followersCount = developer.followersCount {
            details.append("👥 \(followersCount) followers")
        }
        if let websiteURL = developer.websiteURL {
            let isIncludedInSocial = developer.socialAccounts.contains(where: { $0.url.absoluteString == websiteURL.absoluteString })
            if !isIncludedInSocial {
                let icon = socialIconImageHTML(provider: "generic", url: websiteURL)
                details.append("\(icon)<a href=\"\(websiteURL.absoluteString.xmlEscaped)\">\(websiteURL.absoluteString.xmlEscaped)</a>")
            }
        }

        if !developer.socialAccounts.isEmpty {
            for account in developer.socialAccounts {
                let icon = socialIconImageHTML(provider: account.provider, url: account.url)
                let label = account.displayName.isEmpty ? account.url.absoluteString : account.displayName
                details.append("\(icon)<a href=\"\(account.url.absoluteString.xmlEscaped)\">\(label.xmlEscaped)</a>")
            }
        } else if let twitterUsername = developer.twitterUsername, !twitterUsername.isEmpty {
            let cleanTwitter = twitterUsername.prefixDeleted(prefix: "@")
            if let twitterURL = URL(string: "https://x.com/\(cleanTwitter)") {
                let icon = socialIconImageHTML(provider: "twitter", url: twitterURL)
                details.append("\(icon)<a href=\"\(twitterURL.absoluteString.xmlEscaped)\">@\(cleanTwitter.xmlEscaped)</a>")
            }
        }
        if !details.isEmpty {
            html += "<p>" + details.joined(separator: " · ") + "</p>"
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
            html += "<h4>Popular Repository</h4><p><a href=\"\(href.xmlEscaped)\"><strong>\(popRepo.name.xmlEscaped)</strong></a>"
            if let summary = popRepo.summary, !summary.isEmpty {
                html += "<br>\(summary.xmlEscaped.linkifyingGitHubMentions())"
            }
            html += "</p>"
        }

        if !developer.pinnedRepositories.isEmpty {
            html += "<h4>Pinned Repositories</h4><ul>"
            for pinned in developer.pinnedRepositories {
                html += "<li><a href=\"\(pinned.url.absoluteString.xmlEscaped)\"><strong>\(pinned.name.xmlEscaped)</strong></a>"
                if let stars = pinned.stargazerCount {
                    html += " ⭐ \(stars)"
                }
                if let summary = pinned.summary, !summary.isEmpty {
                    html += "<br>\(summary.xmlEscaped.linkifyingGitHubMentions())"
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

    private func iconName(provider: String, url: URL) -> String {
        let p = provider.lowercased()
        let host = url.host?.lowercased() ?? ""

        if p == "bluesky" || host.contains("bsky.app") || host.contains("bluesky") {
            return "bluesky"
        } else if p == "youtube" || host.contains("youtube.com") || host.contains("youtu.be") {
            return "youtube"
        } else if p == "twitter" || p == "x" || host.contains("twitter.com") || host.contains("x.com") {
            return "twitter"
        } else if p == "mastodon" || host.contains("mastodon") || host.contains("mstdn") {
            return "mastodon"
        } else if p == "linkedin" || host.contains("linkedin.com") {
            return "linkedin"
        } else if p == "instagram" || host.contains("instagram.com") {
            return "instagram"
        } else if p == "twitch" || host.contains("twitch.tv") {
            return "twitch"
        } else if p == "tiktok" || host.contains("tiktok.com") {
            return "tiktok"
        } else if p == "facebook" || host.contains("facebook.com") {
            return "facebook"
        } else {
            return "generic"
        }
    }

    private func socialIconImageHTML(provider: String, url: URL) -> String {
        let name = iconName(provider: provider, url: url)
        let cleanBaseURL = information.rssHomeURL.hasSuffix("/") ? String(information.rssHomeURL.dropLast()) : information.rssHomeURL
        let iconURL = "\(cleanBaseURL)/assets/icons/\(name).svg"
        return #"<img src="\#(iconURL.xmlEscaped)" width="20" height="20" alt="\#(name.xmlEscaped)" style="vertical-align: text-bottom; margin-right: 4px; display: inline-block;" />"#
    }
}
