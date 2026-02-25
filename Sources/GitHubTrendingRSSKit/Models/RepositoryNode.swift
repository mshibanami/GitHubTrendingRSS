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

public struct RepositoryNode: Decodable {
    public let openGraphImageUrl: URL
    public let usesCustomOpenGraphImage: Bool
    public let id: String
    
    public init(openGraphImageUrl: URL, usesCustomOpenGraphImage: Bool, id: String) {
        self.openGraphImageUrl = openGraphImageUrl
        self.usesCustomOpenGraphImage = usesCustomOpenGraphImage
        self.id = id
    }
}
