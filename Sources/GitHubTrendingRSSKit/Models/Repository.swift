// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct Repository {
    public let pageLink: RepositoryPageLink
    public let summary: String
    public var readMe: APIReadMe?

    public init(pageLink: RepositoryPageLink, summary: String) {
        self.pageLink = pageLink
        self.summary = summary
    }
}
