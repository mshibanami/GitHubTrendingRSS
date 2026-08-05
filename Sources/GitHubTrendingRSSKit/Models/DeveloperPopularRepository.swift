// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct DeveloperPopularRepository: Hashable, Sendable {
    public let name: String
    public let href: String
    public let summary: String?

    public init(name: String, href: String, summary: String?) {
        self.name = name
        self.href = href
        self.summary = summary
    }
}
