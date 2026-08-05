// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct DeveloperPinnedRepository: Hashable, Sendable {
    public let name: String
    public let url: URL
    public let summary: String?
    public let stargazerCount: Int?

    public init(name: String, url: URL, summary: String?, stargazerCount: Int?) {
        self.name = name
        self.url = url
        self.summary = summary
        self.stargazerCount = stargazerCount
    }
}
