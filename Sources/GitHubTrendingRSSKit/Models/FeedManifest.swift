// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct FeedManifestFeedPaths: Codable, Equatable, Sendable {
    public let daily: String
    public let weekly: String
    public let monthly: String

    public init(daily: String, weekly: String, monthly: String) {
        self.daily = daily
        self.weekly = weekly
        self.monthly = monthly
    }
}

public struct FeedManifestLanguage: Codable, Equatable, Sendable {
    public let displayName: String
    public let slug: String
    public let feeds: FeedManifestFeedPaths

    public init(displayName: String, slug: String, feeds: FeedManifestFeedPaths) {
        self.displayName = displayName
        self.slug = slug
        self.feeds = feeds
    }
}

public struct FeedManifest: Codable, Equatable, Sendable {
    public let generatedAt: String
    public let latestBuildDate: String
    public let languages: [FeedManifestLanguage]

    public init(generatedAt: String, latestBuildDate: String, languages: [FeedManifestLanguage]) {
        self.generatedAt = generatedAt
        self.latestBuildDate = latestBuildDate
        self.languages = languages
    }

    public init(languageTrendingLinks: [LanguageTrendingLink], date: Date = Date()) {
        let buildDateFormatter = DateFormatter()
        buildDateFormatter.dateFormat = "d MMMM, yyyy"
        buildDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        buildDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        let iso8601Formatter = ISO8601DateFormatter()

        self.init(
            generatedAt: iso8601Formatter.string(from: date),
            latestBuildDate: buildDateFormatter.string(from: date),
            languages: languageTrendingLinks.map { link in
                FeedManifestLanguage(
                    displayName: link.displayName,
                    slug: link.name,
                    feeds: FeedManifestFeedPaths(
                        daily: "daily/\(link.name).xml",
                        weekly: "weekly/\(link.name).xml",
                        monthly: "monthly/\(link.name).xml"
                    )
                )
            }
        )
    }
}
