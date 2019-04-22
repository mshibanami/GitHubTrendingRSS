// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import SwiftSoup

public extension Elements {
    var trimmedText: String? {
        return (try? text())?.trimmedText
    }
}

public extension Element {
    var trimmedText: String? {
        return (try? text())?.trimmedText
    }
}

fileprivate extension String {
    var trimmedText: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
