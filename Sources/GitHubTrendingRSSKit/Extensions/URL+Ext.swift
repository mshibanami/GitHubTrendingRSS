// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public extension URL {
    init?(sanitizedURLString string: String?) {
        guard let string else {
            return nil
        }
        let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            return nil
        }
        if let url = URL(string: trimmed), let scheme = url.scheme, !scheme.isEmpty {
            if scheme.lowercased() == "http" || scheme.lowercased() == "https" {
                guard let host = url.host, !host.isEmpty else {
                    return nil
                }
            }
            self = url
        } else if let url = URL(string: "https://\(trimmed)"), let host = url.host, !host.isEmpty {
            self = url
        } else {
            return nil
        }
    }
}
