// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct DeveloperOrganization: Hashable, Sendable {
    public let login: String
    public let name: String?
    public let url: URL

    public init(login: String, name: String?, url: URL) {
        self.login = login
        self.name = name
        self.url = url
    }
}
