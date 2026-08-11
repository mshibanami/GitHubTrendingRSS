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

        public init(
            pageTitle: String, author: String, rssHomeURL: String, googleAnalyticsTrackingCode: String,
            gitHubRepositoryURL: String
        ) {
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

    public func makeRSS(
        from languageTrendingLink: LanguageTrendingLink, period: Period,
        spokenLanguage: SpokenLanguage = .unspecified, repositories: [Repository],
        supportedEmojis: [GitHubEmoji]
    ) async throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM YYYY HH:mm:ss 'GMT'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let pubDate = formatter.string(from: Date())

        let noDescriptionHTML =
            #"<p style="color:#586069;"><em>No description/README provided.</em></p>"#

        var repositoryContexts:
            [(
                description: String, userID: String, repositoryName: String, url: String,
                pageLink: RepositoryPageLink, openGraphImageUrl: String?
            )] = []
        for repository in repositories {
            let cacheKey =
                "\(repository.pageLink.url.absoluteString)|hasReadMe:\(repository.readMe != nil)"
            let renderedHTML = try await descriptionHTMLCache.value(for: cacheKey) {
                try await repository.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)
            }
            let descriptionHTML = renderedHTML ?? noDescriptionHTML
            repositoryContexts.append(
                (
                    description: descriptionHTML.xml10Sanitized.xmlEscaped,
                    userID: repository.pageLink.userID,
                    repositoryName: repository.pageLink.repositoryName,
                    url: repository.pageLink.url.absoluteString,
                    pageLink: repository.pageLink,
                    openGraphImageUrl: repository.openGraphImageUrl?.absoluteString.xmlEscaped
                )
            )
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
            let popRepoStars = developer.popularRepository?.stargazerCount ?? -1
            let popRepoForks = developer.popularRepository?.forkCount ?? -1
            let pinnedList = developer.pinnedRepositories.map {
                "\($0.url.absoluteString)|\($0.summary ?? "")|\($0.stargazerCount ?? -1)|\($0.forkCount ?? -1)"
            }.joined(separator: ",")
            let popularList = developer.popularRepositories.map {
                "\($0.href)|\($0.summary ?? "")|\($0.stargazerCount ?? -1)|\($0.forkCount ?? -1)"
            }.joined(separator: ",")
            let socialList = developer.socialAccounts.map { "\($0.provider):\($0.url.absoluteString)" }
                .joined(separator: ",")
            let cacheKey =
                "dev:\(developer.username)|pop:\(popRepoHref)|popStars:\(popRepoStars)|popForks:\(popRepoForks)|hasReadMe:\(developer.profileReadMe != nil)|pinned:\(pinnedList)|popular:\(popularList)|followers:\(developer.followersCount ?? -1)|following:\(developer.followingCount ?? -1)|repos:\(developer.publicReposCount ?? -1)|company:\(developer.company ?? "")|bio:\(developer.bio ?? "")|email:\(developer.email ?? "")|tw:\(developer.twitterUsername ?? "")|web:\(developer.websiteURL?.absoluteString ?? "")|social:\(socialList)"
            let descriptionHTML =
                try await descriptionHTMLCache.value(for: cacheKey) {
                    try await self.buildDeveloperDescriptionHTML(
                        developer: developer, supportedEmojis: supportedEmojis
                    )
                } ?? ""

            let title =
                developer.displayName != developer.username
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

    private func buildDeveloperDescriptionHTML(developer: Developer, supportedEmojis: [GitHubEmoji])
    async throws -> String {
        var html = ""

        let nameHTML =
            if developer.displayName != developer.username {
                #"<strong><a href="https://github.com/\#(developer.username.xmlEscaped)">\#(developer.displayName.xmlEscaped)</a></strong><br><span style="color: #57606a;">@\#(developer.username.xmlEscaped)</span>"#
            } else {
                #"<strong><a href="https://github.com/\#(developer.username.xmlEscaped)">@\#(developer.username.xmlEscaped)</a></strong>"#
            }

        if let avatarURL = developer.avatarURL {
            html +=
                #"<table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 12px;"><tr>"#
            html +=
                #"<td style="vertical-align: middle; padding-right: 12px;"><img src="\#(avatarURL.absoluteString.xmlEscaped)" width="96" height="96" alt="@\#(developer.username.xmlEscaped)" style="margin: 0; padding: 0; border-radius: 50%;" /></td>"#
            html += #"<td style="vertical-align: middle;">\#(nameHTML)</td>"#
            html += "</tr></table>"
        } else {
            html += #"<div style="margin-bottom: 12px;">\#(nameHTML)</div>"#
        }

        if let bio = developer.bio, !bio.isEmpty {
            html +=
                "<p>\(descriptionTextHTML(bio, supportedEmojis: supportedEmojis, linkifyingMentions: true))</p>"
        }

        if developer.isSponsorable {
            html += "<p>💖 <strong>Sponsorable</strong></p>"
        }

        var relationshipStats = [String]()
        if let followersCount = developer.followersCount {
            relationshipStats.append("<strong>\(formatCount(followersCount))</strong> followers")
        }
        if let followingCount = developer.followingCount {
            relationshipStats.append("<strong>\(formatCount(followingCount))</strong> following")
        }
        if !relationshipStats.isEmpty {
            html += "<p>\(relationshipStats.joined(separator: " · "))</p>"
        }

        var details = [String]()
        if let company = developer.company, !company.isEmpty {
            let icon = iconImageHTML(name: "building", rightMargin: 8)
            details.append(
                "\(icon)\(descriptionTextHTML(company, supportedEmojis: supportedEmojis, linkifyingMentions: true))"
            )
        }
        if let location = developer.location, !location.isEmpty {
            let icon = iconImageHTML(name: "map-pin", rightMargin: 8)
            details.append("\(icon)\(descriptionTextHTML(location, supportedEmojis: supportedEmojis))")
        }
        if let email = developer.email?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty {
            let icon = iconImageHTML(name: "mail", rightMargin: 8)
            details.append("\(icon)<a href=\"mailto:\(email.xmlEscaped)\">\(email.xmlEscaped)</a>")
        }
        if let websiteURL = developer.websiteURL {
            let isIncludedInSocial = developer.socialAccounts.contains(where: {
                $0.url.absoluteString == websiteURL.absoluteString
            })
            if !isIncludedInSocial {
                let icon = socialIconImageHTML(provider: "generic", url: websiteURL, rightMargin: 8)
                details.append(
                    "\(icon)<a href=\"\(websiteURL.absoluteString.xmlEscaped)\">\(websiteURL.absoluteString.xmlEscaped)</a>"
                )
            }
        }

        if !developer.socialAccounts.isEmpty {
            for account in developer.socialAccounts {
                let icon = socialIconImageHTML(
                    provider: account.provider,
                    url: account.url,
                    rightMargin: 8
                )
                let label = account.displayName.isEmpty ? account.url.absoluteString : account.displayName
                details.append(
                    "\(icon)<a href=\"\(account.url.absoluteString.xmlEscaped)\">\(label.xmlEscaped)</a>"
                )
            }
        } else if let twitterUsername = developer.twitterUsername, !twitterUsername.isEmpty {
            let cleanTwitter = twitterUsername.prefixDeleted(prefix: "@")
            if let twitterURL = URL(string: "https://x.com/\(cleanTwitter)") {
                let icon = socialIconImageHTML(provider: "twitter", url: twitterURL, rightMargin: 8)
                details.append(
                    "\(icon)<a href=\"\(twitterURL.absoluteString.xmlEscaped)\">@\(cleanTwitter.xmlEscaped)</a>"
                )
            }
        }
        if !details.isEmpty {
            let listItems = details.map {
                "<li style=\"list-style-type: none; margin-bottom: 4px;\">\($0)</li>"
            }.joined()
            html += "<ul style=\"list-style-type: none; padding-left: 0;\">\(listItems)</ul>"
        }

        if let popRepo = developer.popularRepository {
            let href = gitHubRepositoryURL(from: popRepo.href)
            html +=
                "<h4>Popular Repository</h4><p><a href=\"\(href.xmlEscaped)\"><strong>\(popRepo.name.xmlEscaped)</strong></a>"
            if let stars = popRepo.stargazerCount {
                html += " \(iconImageHTML(name: "star"))\(formatCount(stars))"
            }
            if let forks = popRepo.forkCount {
                html +=
                    " \(iconImageHTML(name: "git-fork"))\(formatCount(forks))"
            }
            if let summary = popRepo.summary, !summary.isEmpty {
                html +=
                    "<br>\(descriptionTextHTML(summary, supportedEmojis: supportedEmojis, linkifyingMentions: true))"
            }
            html += "</p>"
        }

        let popularRepositoryURL = developer.popularRepository.map {
            gitHubRepositoryURL(from: $0.href)
        }
        let pinnedRepositories = developer.pinnedRepositories.filter { pinned in
            guard let popularRepositoryURL else {
                return true
            }
            return !isSameGitHubRepository(pinned.url, popularRepositoryURL)
        }
        let popularRepositories = developer.popularRepositories.filter { popular in
            guard let popularURL = URL(string: gitHubRepositoryURL(from: popular.href)) else {
                return false
            }
            if let popularRepositoryURL, isSameGitHubRepository(popularURL, popularRepositoryURL) {
                return false
            }
            return !pinnedRepositories.contains { isSameGitHubRepository(popularURL, $0.url) }
        }
        if !pinnedRepositories.isEmpty {
            html += "<h4>Other Repositories (Pinned)</h4><ul>"
            for pinned in pinnedRepositories {
                html +=
                    "<li><a href=\"\(pinned.url.absoluteString.xmlEscaped)\"><strong>\(pinned.name.xmlEscaped)</strong></a>"
                if let stars = pinned.stargazerCount {
                    html +=
                        " \(iconImageHTML(name: "star"))\(formatCount(stars))"
                }
                if let forks = pinned.forkCount {
                    html +=
                        " \(iconImageHTML(name: "git-fork"))\(formatCount(forks))"
                }
                if let summary = pinned.summary, !summary.isEmpty {
                    html +=
                        "<br>\(descriptionTextHTML(summary, supportedEmojis: supportedEmojis, linkifyingMentions: true))"
                }
                html += "</li>"
            }
            html += "</ul>"
        } else if !popularRepositories.isEmpty {
            html += "<h4>Other Repositories (Popular)</h4><ul>"
            for popular in popularRepositories.prefix(6) {
                let href = gitHubRepositoryURL(from: popular.href)
                html +=
                    "<li><a href=\"\(href.xmlEscaped)\"><strong>\(popular.name.xmlEscaped)</strong></a>"
                if let stars = popular.stargazerCount {
                    html +=
                        " \(iconImageHTML(name: "star"))\(formatCount(stars))"
                }
                if let forks = popular.forkCount {
                    html +=
                        " \(iconImageHTML(name: "git-fork"))\(formatCount(forks))"
                }
                if let summary = popular.summary, !summary.isEmpty {
                    html +=
                        "<br>\(descriptionTextHTML(summary, supportedEmojis: supportedEmojis, linkifyingMentions: true))"
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

    private func descriptionTextHTML(
        _ text: String,
        supportedEmojis: [GitHubEmoji],
        linkifyingMentions: Bool = false
    ) -> String {
        let emojiNormalized = text
            .xmlEscaped
            .replacingGitHubEmojiShortcodes(supportedEmojis: supportedEmojis)
        return linkifyingMentions ? emojiNormalized.linkifyingGitHubMentions() : emojiNormalized
    }

    private func formatCount(_ count: Int) -> String {
        let absoluteCount = abs(count)
        let units: [(divisor: Double, suffix: String)] = [
            (1_000_000_000_000, "T"),
            (1_000_000_000, "B"),
            (1_000_000, "M"),
            (1_000, "k"),
        ]
        guard let unitIndex = units.firstIndex(where: { Double(absoluteCount) >= $0.divisor }) else {
            return "\(count)"
        }

        var selectedUnitIndex = unitIndex
        var rounded = (Double(count) / units[selectedUnitIndex].divisor * 10).rounded() / 10
        if abs(rounded) >= 1_000, selectedUnitIndex > 0 {
            selectedUnitIndex -= 1
            rounded = (Double(count) / units[selectedUnitIndex].divisor * 10).rounded() / 10
        }
        if rounded.rounded() == rounded {
            return "\(Int(rounded))\(units[selectedUnitIndex].suffix)"
        }
        return "\(rounded)\(units[selectedUnitIndex].suffix)"
    }

    private func gitHubRepositoryURL(from href: String) -> String {
        if href.hasPrefix("http://") || href.hasPrefix("https://") {
            return href
        }
        if href.hasPrefix("/") {
            return "https://github.com" + href
        }
        return "https://github.com/" + href
    }

    private func isSameGitHubRepository(_ lhs: URL, _ rhs: String) -> Bool {
        guard let rhsURL = URL(string: rhs) else {
            return false
        }
        return isSameGitHubRepository(lhs, rhsURL)
    }

    private func isSameGitHubRepository(_ lhs: URL, _ rhs: URL) -> Bool {
        return lhs.host?.caseInsensitiveCompare(rhs.host ?? "") == .orderedSame
            && lhs.path.trimmingCharacters(in: CharacterSet(charactersIn: "/")).caseInsensitiveCompare(
                rhs.path.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
            ) == .orderedSame
    }

    private func iconName(provider: String, url: URL) -> String? {
        let p = provider.lowercased()
        let host = url.host?.lowercased() ?? ""

        if p == "deviantart" || host.contains("deviantart") {
            return "deviantart"
        } else if p == "dribbble" || host.contains("dribbble.com") {
            return "dribbble"
        } else if p == "bluesky" || host.contains("bsky.app") || host.contains("bluesky") {
            return "bluesky"
        } else if p == "discord" || host.contains("discord.com") || host.contains("discord.gg") || host.contains("discord") {
            return "discord"
        } else if p == "facebook" || host.contains("facebook.com") {
            return "facebook"
        } else if p == "instagram" || host.contains("instagram.com") {
            return "instagram"
        } else if p == "orcid" || host == "orcid.org" || host.hasSuffix(".orcid.org") {
            return "orcid"
        } else if p == "linkedin" || host.contains("linkedin.com") {
            return "linkedin"
        } else if p == "mastodon" || host.contains("mastodon") || host.contains("mstdn") {
            return "mastodon"
        } else if p == "patreon" || host.contains("patreon.com") {
            return "patreon"
        } else if p == "pinterest" || host.contains("pinterest.") {
            return "pinterest"
        } else if p == "reddit" || host.contains("reddit.com") {
            return "reddit"
        } else if p == "stackoverflow" || p == "stack_overflow" || host.contains("stackoverflow.com") {
            return "stackoverflow"
        } else if p == "substack" || host.contains("substack.com") {
            return "substack"
        } else if p == "telegram" || host.contains("telegram") || host.contains("t.me") {
            return "telegram"
        } else if p == "threads" || host.contains("threads.net") || host.contains("threads.com") {
            return "threads"
        } else if p == "tiktok" || host.contains("tiktok.com") {
            return "tiktok"
        } else if p == "twitch" || host.contains("twitch.tv") {
            return "twitch"
        } else if p == "whatsapp" || host.contains("whatsapp.com") {
            return "whatsapp"
        } else if p == "youtube" || host.contains("youtube.com") || host.contains("youtu.be") {
            return "youtube"
        } else if p == "x" || p == "twitter" || host == "x.com" || host.hasSuffix(".x.com")
            || host.contains("twitter.com") {
            return "twitter"
        } else {
            return "link"
        }
    }

    private func socialIconImageHTML(provider: String, url: URL, rightMargin: Int = 4) -> String {
        guard let name = iconName(provider: provider, url: url) else {
            return ""
        }
        return iconImageHTML(name: name, rightMargin: rightMargin)
    }

    private func iconImageHTML(
        name: String,
        verticalAlign: String = "middle",
        rightMargin: Int = 4
    ) -> String {
        let cleanBaseURL =
            information.rssHomeURL.hasSuffix("/")
            ? String(information.rssHomeURL.dropLast()) : information.rssHomeURL
        let iconURL = "\(cleanBaseURL)/assets/icons/\(name).png"
        return
            #"<img src="\#(iconURL.xmlEscaped)" width="20" height="20" alt="\#(name.xmlEscaped)" style="margin: 0 \#(rightMargin)px 0 0; padding: 0; display: inline-block; vertical-align: \#(verticalAlign.xmlEscaped);" />"#
    }
}
