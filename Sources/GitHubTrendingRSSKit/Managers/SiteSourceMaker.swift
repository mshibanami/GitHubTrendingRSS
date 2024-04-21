// Copyright (c) 2019 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import Stencil

public class SiteSourceMaker {
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

    public func makeRSS(from languageTrendingLink: LanguageTrendingLink, period: Period, repositories: [Repository], supportedEmojis: [GitHubEmoji]) throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM YYYY HH:mm:ss 'GMT'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let pubDate = formatter.string(from: Date())

        let noDescriptionHTML = #"<p style="color:#586069;"><em>No description/README provided.</em></p>"#

        let context: [String: Any] = [
            "languageTrendingLink": languageTrendingLink,
            "information": information,
            "periodText": period.rawValue.capitalized,
            "pubDate": pubDate,
            "repositories": repositories.map {
                (
                    description: ($0.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis) ?? noDescriptionHTML).xmlEscaped,
                    userID: $0.pageLink.userID,
                    repositoryName: $0.pageLink.repositoryName,
                    url: $0.pageLink.url.absoluteString,
                    pageLink: $0.pageLink
                )
            },
            "periods": Period.allCases.map(\.rawValue),
        ]

        return try environment.renderTemplate(
            name: "rss_template.xml",
            context: context
        )
    }
}
