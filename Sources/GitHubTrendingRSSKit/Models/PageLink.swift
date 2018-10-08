// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public struct PageLink: PageLinkable {
    public var href: String

    public init(href: String) {
        self.href = href
    }
}
