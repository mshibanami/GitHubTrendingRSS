// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public extension String {
    var xml10Sanitized: String {
        var sanitized = ""
        for scalar in unicodeScalars {
            let value = scalar.value
            let isValid = value == 0x9
                || value == 0xA
                || value == 0xD
                || (0x20...0xD7FF).contains(value)
                || (0xE000...0xFFFD).contains(value)
                || (0x10000...0x10FFFF).contains(value)
            if isValid {
                sanitized.unicodeScalars.append(scalar)
            }
        }
        return sanitized
    }

    var xmlEscaped: String {
        return replacingOccurrences(of: "&", with: "&amp;")
            .replacingOccurrences(of: "'", with: "&#39;")
            .replacingOccurrences(of: "\"", with: "&quot;")
            .replacingOccurrences(of: "<", with: "&lt;")
            .replacingOccurrences(of: ">", with: "&gt;")
    }

    func prefixDeleted(prefix: String) -> String {
        guard hasPrefix(prefix) else {
            return self
        }
        return String(dropFirst(prefix.count))
    }
}
