// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import DocslothAsciidoctor
import DocslothMarkdownItGFMCJKFriendly
import Foundation
import SwiftSoup

public struct Developer: @unchecked Sendable {
    public let username: String
    public let displayName: String
    public let avatarURL: URL?
    public let popularRepository: DeveloperPopularRepository?
    public var pinnedRepositories: [DeveloperPinnedRepository]
    public let isSponsorable: Bool
    public var bio: String?
    public var company: String?
    public var location: String?
    public var followersCount: Int?
    public var publicReposCount: Int?
    public var websiteURL: URL?
    public var twitterUsername: String?
    public var profileReadMe: APIReadMe?

    public init(
        username: String,
        displayName: String,
        avatarURL: URL?,
        popularRepository: DeveloperPopularRepository?,
        pinnedRepositories: [DeveloperPinnedRepository] = [],
        isSponsorable: Bool = false,
        bio: String? = nil,
        company: String? = nil,
        location: String? = nil,
        followersCount: Int? = nil,
        publicReposCount: Int? = nil,
        websiteURL: URL? = nil,
        twitterUsername: String? = nil,
        profileReadMe: APIReadMe? = nil
    ) {
        self.username = username
        self.displayName = displayName
        self.avatarURL = avatarURL
        self.popularRepository = popularRepository
        self.pinnedRepositories = pinnedRepositories
        self.isSponsorable = isSponsorable
        self.bio = bio
        self.company = company
        self.location = location
        self.followersCount = followersCount
        self.publicReposCount = publicReposCount
        self.websiteURL = websiteURL
        self.twitterUsername = twitterUsername
        self.profileReadMe = profileReadMe
    }

    public func makeReadMeHTML(supportedEmojis: [GitHubEmoji]) async throws -> String? {
        guard let profileReadMe else {
            return nil
        }
        return try await profileReadMe.makeHTML(supportedEmojis: supportedEmojis)
    }
}
