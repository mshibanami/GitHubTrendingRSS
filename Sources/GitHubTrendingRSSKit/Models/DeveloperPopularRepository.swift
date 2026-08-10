// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct DeveloperPopularRepository: Hashable, Sendable {
    public let name: String
    public let href: String
    public let summary: String?
    public var stargazerCount: Int?
    public var forkCount: Int?

    public init(
        name: String, href: String, summary: String?, stargazerCount: Int? = nil, forkCount: Int? = nil
    ) {
        self.name = name
        self.href = href
        self.summary = summary
        self.stargazerCount = stargazerCount
        self.forkCount = forkCount
    }

    public init(
        name: String, url: URL, summary: String?, stargazerCount: Int? = nil, forkCount: Int? = nil
    ) {
        self.init(
            name: name,
            href: url.absoluteString,
            summary: summary,
            stargazerCount: stargazerCount,
            forkCount: forkCount
        )
    }
}
