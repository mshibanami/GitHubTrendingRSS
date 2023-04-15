// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import MarkdownSyntax
import SwiftAsciidoctor
import SwiftSoup

public struct Repository {
    public let pageLink: RepositoryPageLink
    public let summary: String
    public var readMe: APIReadMe?

    private let asciidoctor = SwiftAsciidoctor()

    public init(pageLink: RepositoryPageLink, summary: String) {
        self.pageLink = pageLink
        self.summary = summary
    }

    public func makeReadMeHTML(includesSummary: Bool, supportedEmojis: [GitHubEmoji]) -> String? {
        var html: String?
        if includesSummary {
            html = (html ?? "") + #"<p>\#(summary)</p><hr>"#
        }

        guard let readMe = readMe,
              let readMeHTML = renderHTML(from: readMe) else {
            return html
        }
        let nomalizedReadMeHTML = normalizeEmojisInHTML(readMeHTML, supportedEmojis: supportedEmojis)
        guard let parsedHTML = try? SwiftSoup.parse(nomalizedReadMeHTML) else {
            return html
        }

        guard let blobToRawRegex = try? NSRegularExpression(
            pattern: "(https://github.com/[^/]+/[^/]+/)blob(/.+)",
                options: []) else {
            assertionFailure()
            return html
        }

        let tagAttributesPairs = [
            "a": ["href"],
            "area": ["href"],
            "img": ["src", "longdesc", "usemap"],
            "link": ["href"],
            "blockquote": ["cite"]
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
                    if absoluteURL.hasSuffix(".svg") && tag == "img" && attribute == "src" {
                        absoluteURL += "?sanitize=true"
                    }

                    absoluteURL = blobToRawRegex.stringByReplacingMatches(
                        in: absoluteURL,
                        range: NSRange(absoluteURL.startIndex..., in: absoluteURL),
                        withTemplate: "$1raw$2")

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

    func renderHTML(from readMe: APIReadMe) -> String? {
        guard let content = readMe.content else {
            return nil
        }
        let html: String?
        switch readMe.fileType {
        case .markdown, .unknown:
            html = try? Markdown(text: content, options: .unsafe).renderHtml()
        case .asciiDoc:
            html = try? asciidoctor.convert(
                content,
                options: [.attributes([
                    "showtitle": true
                ])])
        }
        return html
    }
}

private extension GitHubEmoji {
    var html: String {
        switch value {
        case .text(let text):
            return "<span>\(text)</span>"
        case .image(let url):
            return "<img alt='\(id)' src='\(url.absoluteString)' />)"
        }
    }
}
