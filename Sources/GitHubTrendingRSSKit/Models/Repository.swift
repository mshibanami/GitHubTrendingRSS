// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import DocslothAsciidoctor
import DocslothMarkdownItGFMCJKFriendly
import Foundation
import SwiftSoup

public struct Repository: @unchecked Sendable {
    public let pageLink: RepositoryPageLink
    public let summary: String
    public var readMe: APIReadMe?
    public var openGraphImageUrl: URL?
    public var usesCustomOpenGraphImage: Bool = false

    public init(pageLink: RepositoryPageLink, summary: String) {
        self.pageLink = pageLink
        self.summary = summary
    }

    public func makeReadMeHTML(includesSummary: Bool, supportedEmojis: [GitHubEmoji]) async throws -> String? {
        var html: String?
        if includesSummary, !summary.isEmpty {
            html = (html ?? "") + #"<p>\#(summary)</p><hr>"#
        }

        guard let readMe,
              let readMeHTML = try await renderHTML(from: readMe) else {
            return html
        }
        let nomalizedReadMeHTML = normalizeEmojisInHTML(readMeHTML, supportedEmojis: supportedEmojis)
        guard let parsedHTML = try? SwiftSoup.parse(nomalizedReadMeHTML) else {
            return html
        }

        guard let blobToRawRegex = try? NSRegularExpression(
            pattern: "(https://github.com/[^/]+/[^/]+/)blob(/.+)",
            options: []
        ) else {
            assertionFailure()
            return html
        }

        let tagAttributesPairs = [
            "a": ["href"],
            "area": ["href"],
            "img": ["src", "longdesc", "usemap"],
            "link": ["href"],
            "blockquote": ["cite"],
        ]

        for (tag, attributes) in tagAttributesPairs {
            guard let elements = try? parsedHTML.getElementsByTag(tag) else {
                continue
            }
            for element in elements {
                for attribute in attributes {
                    guard let url = try? element.attr(attribute).prefixDeleted(prefix: "/"),
                          let baseURL = readMe.fileRootURL,
                          var absoluteURL = URL(string: url, relativeTo: baseURL)?.absoluteString else {
                        continue
                    }
                    if absoluteURL.hasSuffix(".svg"), tag == "img", attribute == "src" {
                        absoluteURL += "?sanitize=true"
                    }

                    absoluteURL = blobToRawRegex.stringByReplacingMatches(
                        in: absoluteURL,
                        range: NSRange(absoluteURL.startIndex..., in: absoluteURL),
                        withTemplate: "$1raw$2"
                    )

                    if absoluteURL != url {
                        _ = try? element.attr(attribute, absoluteURL)
                    }
                }
            }
        }
        if let readMeHTML = try? parsedHTML.body()?.html() {
            html = (html ?? "") + readMeHTML
        }
        return html
    }

    func normalizeEmojisInHTML(_ readMeHTML: String, supportedEmojis: [GitHubEmoji]) -> String {
        var nomalized = readMeHTML
        for emoji in supportedEmojis {
            let target = ":" + emoji.id + ":"
            nomalized = nomalized.replacingOccurrences(of: target, with: emoji.html)
        }
        return nomalized
    }

    func renderHTML(from readMe: APIReadMe) async throws -> String? {
        guard let content = readMe.content else {
            return nil
        }
        let html: String?
        switch readMe.fileType {
        case .markdown, .unknown:
            html = try await DocslothManager.shared.markdownIt.convertToHTML(content)
        case .asciiDoc:
            html = try await DocslothManager.shared.asciidoctor.convertToHTML(content)
        }
        return html
    }
}

private extension GitHubEmoji {
    var html: String {
        switch value {
        case let .text(text):
            return "<span>\(text)</span>"
        case let .image(url):
            return "<img alt='\(id)' src='\(url.absoluteString)' />)"
        }
    }
}
