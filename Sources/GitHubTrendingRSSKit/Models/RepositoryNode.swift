// Copyright (c) 2023 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct GraphQLResponse<T: Decodable>: Decodable {
    public let data: T?
    public let errors: [GraphQLError]?

    public init(data: T?, errors: [GraphQLError]? = nil) {
        self.data = data
        self.errors = errors
    }
}

public struct GraphQLError: Decodable {
    public let type: String?
    public let message: String

    public init(type: String?, message: String) {
        self.type = type
        self.message = message
    }
}

public struct RepositoryNode: Decodable, Sendable {
    public let openGraphImageUrl: URL
    public let usesCustomOpenGraphImage: Bool
    public let homepageUrl: URL?
    public let id: String
    public let stargazerCount: Int?
    public let forkCount: Int?

    public init(
        openGraphImageUrl: URL,
        usesCustomOpenGraphImage: Bool,
        homepageUrl: URL? = nil,
        id: String,
        stargazerCount: Int? = nil,
        forkCount: Int? = nil
    ) {
        self.openGraphImageUrl = openGraphImageUrl
        self.usesCustomOpenGraphImage = usesCustomOpenGraphImage
        self.homepageUrl = homepageUrl
        self.id = id
        self.stargazerCount = stargazerCount
        self.forkCount = forkCount
    }
}
