// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Kanna

public extension XMLElement {
    public var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
