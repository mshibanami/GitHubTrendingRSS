// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public enum SpokenLanguage: String, CaseIterable, Sendable {
    case unspecified
    case en

    public var code: String? {
        self == .unspecified ? nil : rawValue
    }

    public var urlPathPrefix: String {
        self == .unspecified ? "" : rawValue
    }

    public var displayName: String {
        switch self {
        case .unspecified:
            "All Spoken Languages"
        case .en:
            "English"
        }
    }

    public func outputDirectory(relativeTo baseURL: URL, period: Period) -> URL {
        if urlPathPrefix.isEmpty {
            return baseURL.appendingPathComponent(period.rawValue)
        } else {
            return baseURL.appendingPathComponent(urlPathPrefix).appendingPathComponent(period.rawValue)
        }
    }
}
