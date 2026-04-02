// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import DocslothAsciidoctor
import DocslothMarkdownItGFMCJKFriendly
import Foundation

public final class DocslothManager: Sendable {
    public static let shared = DocslothManager()

    public let markdownIt = MarkdownIt(options: .init(
        base: [
            "html": true,
            "linkify": true,
        ],
        disabledPlugins: [.sanitizeHTML]
    ))
    public let asciidoctor = Asciidoctor()

    private init() {}

    public func setup() async throws {
        try await markdownIt.setup()
        try await asciidoctor.setup()
    }
}
