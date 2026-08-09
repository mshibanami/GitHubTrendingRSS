// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct DeveloperNode: Decodable, Sendable {
    public struct TotalCountContainer: Decodable, Sendable {
        public let totalCount: Int

        public init(totalCount: Int) {
            self.totalCount = totalCount
        }
    }

    public struct PinnedItemNode: Decodable, Sendable {
        public let name: String
        public let url: URL
        public let description: String?
        public let stargazerCount: Int?

        public init(name: String, url: URL, description: String?, stargazerCount: Int?) {
            self.name = name
            self.url = url
            self.description = description
            self.stargazerCount = stargazerCount
        }
    }

    public struct PinnedItemsContainer: Decodable, Sendable {
        public let nodes: [PinnedItemNode]?

        public init(nodes: [PinnedItemNode]?) {
            self.nodes = nodes
        }
    }

    public struct OrganizationNode: Decodable, Sendable {
        public let login: String
        public let name: String?
        public let url: URL

        public init(login: String, name: String?, url: URL) {
            self.login = login
            self.name = name
            self.url = url
        }
    }

    public struct OrganizationsContainer: Decodable, Sendable {
        public let nodes: [OrganizationNode]?

        public init(nodes: [OrganizationNode]?) {
            self.nodes = nodes
        }
    }

    public let bio: String?
    public let company: String?
    public let location: String?
    public let email: String?
    public let followers: TotalCountContainer?
    public let repositories: TotalCountContainer?
    public let websiteUrl: URL?
    public let twitterUsername: String?
    public let socialAccounts: SocialAccountsContainer?
    public let organizations: OrganizationsContainer?
    public let pinnedItems: PinnedItemsContainer?

    public init(
        bio: String? = nil,
        company: String? = nil,
        location: String? = nil,
        email: String? = nil,
        followers: TotalCountContainer? = nil,
        repositories: TotalCountContainer? = nil,
        websiteUrl: URL? = nil,
        twitterUsername: String? = nil,
        socialAccounts: SocialAccountsContainer? = nil,
        organizations: OrganizationsContainer? = nil,
        pinnedItems: PinnedItemsContainer? = nil
    ) {
        self.bio = bio
        self.company = company
        self.location = location
        self.email = email
        self.followers = followers
        self.repositories = repositories
        self.websiteUrl = websiteUrl
        self.twitterUsername = twitterUsername
        self.socialAccounts = socialAccounts
        self.organizations = organizations
        self.pinnedItems = pinnedItems
    }
}

public struct SocialAccountNode: Decodable, Sendable {
    public let provider: String
    public let url: URL
    public let displayName: String

    public init(provider: String, url: URL, displayName: String) {
        self.provider = provider
        self.url = url
        self.displayName = displayName
    }
}

public struct SocialAccountsContainer: Decodable, Sendable {
    public let nodes: [SocialAccountNode]?

    public init(nodes: [SocialAccountNode]?) {
        self.nodes = nodes
    }
}
