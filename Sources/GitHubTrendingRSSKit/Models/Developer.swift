// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import DocslothAsciidoctor
import DocslothMarkdownItGFMCJKFriendly
import Foundation
import SwiftSoup

public struct Developer: @unchecked Sendable {
    public let username: String
    public let displayName: String
    public let avatarURL: URL?
    public var popularRepository: DeveloperPopularRepository?
    public var pinnedRepositories: [DeveloperPinnedRepository]
    public var popularRepositories: [DeveloperPopularRepository]
    public let isSponsorable: Bool
    public var bio: String?
    public var company: String?
    public var location: String?
    public var email: String?
    public var followersCount: Int?
    public var followingCount: Int?
    public var publicReposCount: Int?
    public var websiteURL: URL?
    public var twitterUsername: String?
    public var socialAccounts: [SocialAccount]
    public var profileReadMe: APIReadMe?

    public init(
        username: String,
        displayName: String,
        avatarURL: URL?,
        popularRepository: DeveloperPopularRepository?,
        pinnedRepositories: [DeveloperPinnedRepository] = [],
        popularRepositories: [DeveloperPopularRepository] = [],
        isSponsorable: Bool = false,
        bio: String? = nil,
        company: String? = nil,
        location: String? = nil,
        followersCount: Int? = nil,
        followingCount: Int? = nil,
        publicReposCount: Int? = nil,
        websiteURL: URL? = nil,
        twitterUsername: String? = nil,
        socialAccounts: [SocialAccount] = [],
        profileReadMe: APIReadMe? = nil,
        email: String? = nil
    ) {
        self.username = username
        self.displayName = displayName
        self.avatarURL = avatarURL
        self.popularRepository = popularRepository
        self.pinnedRepositories = pinnedRepositories
        self.popularRepositories = popularRepositories
        self.isSponsorable = isSponsorable
        self.bio = bio
        self.company = company
        self.location = location
        self.email = email
        self.followersCount = followersCount
        self.followingCount = followingCount
        self.publicReposCount = publicReposCount
        self.websiteURL = websiteURL
        self.twitterUsername = twitterUsername
        self.socialAccounts = socialAccounts
        self.profileReadMe = profileReadMe
    }

    public func makeReadMeHTML(supportedEmojis: [GitHubEmoji]) async throws -> String? {
        guard let profileReadMe else {
            return nil
        }
        return try await profileReadMe.makeHTML(supportedEmojis: supportedEmojis)
    }
}

public struct SocialAccount: Sendable, Equatable {
    public let provider: String
    public let url: URL
    public let displayName: String

    public init(provider: String, url: URL, displayName: String) {
        self.provider = provider
        self.url = url
        self.displayName = displayName
    }
}
