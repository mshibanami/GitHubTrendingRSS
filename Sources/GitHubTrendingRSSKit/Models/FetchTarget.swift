// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public enum FetchTarget: String, Sendable, CaseIterable {
    case all
    case repos
    case repositories
    case developers
    case devs

    public init(rawValue: String) {
        switch rawValue.lowercased() {
        case "repos", "repositories":
            self = .repos
        case "developers", "devs":
            self = .developers
        default:
            self = .all
        }
    }

    public var shouldFetchRepos: Bool {
        switch self {
        case .all, .repos, .repositories:
            return true
        case .developers, .devs:
            return false
        }
    }

    public var shouldFetchDevelopers: Bool {
        switch self {
        case .all, .developers, .devs:
            return true
        case .repos, .repositories:
            return false
        }
    }
}
