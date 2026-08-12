// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import DocslothAsciidoctor
import DocslothMarkdownItGFMCJKFriendly
import Foundation
import SwiftSoup

public struct Repository: @unchecked Sendable {
    public let pageLink: RepositoryPageLink
    public let summary: String
    public var readMe: APIReadMe?
    public var websiteURL: URL?
    public var openGraphImageUrl: URL?
    public var usesCustomOpenGraphImage: Bool = false

    public init(pageLink: RepositoryPageLink, summary: String, websiteURL: URL? = nil) {
        self.pageLink = pageLink
        self.summary = summary
        self.websiteURL = websiteURL
    }

    public func makeReadMeHTML(
        includesSummary: Bool,
        supportedEmojis: [GitHubEmoji],
        websiteIconHTML: String? = nil
    ) async throws -> String? {
        var html: String?
        if includesSummary, !summary.isEmpty {
            html = (html ?? "") + #"<p>\#(summary)</p>"#
            if let websiteURL {
                let url = websiteURL.absoluteString
                let icon = websiteIconHTML ?? ""
                html = (html ?? "") + #"<p>\#(icon)<a href="\#(url)">\#(url)</a></p>"#
            }
            html = (html ?? "") + "<hr>"
        } else if let websiteURL {
            let url = websiteURL.absoluteString
            let icon = websiteIconHTML ?? ""
            html = #"<p>\#(icon)<a href="\#(url)">\#(url)</a></p>"#
        }

        guard let readMe else {
            return html
        }
        if let readMeHTML = try await readMe.makeHTML(supportedEmojis: supportedEmojis) {
            html = (html ?? "") + readMeHTML
        }
        return html
    }
}
