//
//  Created by Manabu Nakazawa on 17/3/19.
//
//

import DocslothAsciidoctor
import DocslothMarkdownItGFMCJKFriendly
import Foundation
import SwiftSoup

public struct APIReadMe: Codable, Sendable {
    public enum FileType: CaseIterable {
        case unknown
        case markdown
        case asciiDoc

        var extensions: [String] {
            switch self {
            case .unknown:
                return []
            case .markdown:
                return ["markdown", "mdown", "mkdn", "md"]
            case .asciiDoc:
                return ["asciidoc", "adoc", "asc"]
            }
        }
    }

    public var name: String?
    public var path: String?
    public var sha: String?
    public var size: Int?
    public var url: String?
    public var htmlURL: String?
    public var gitURL: String?
    public var downloadURL: String?
    public var type: String?
    public var encoding: String?
    public var content: String?

    public var userID: String?
    public var repositoryName: String?

    public var branchName: String? {
        guard let url, let urlComponents = URLComponents(string: url) else {
            return nil
        }
        return urlComponents
            .queryItems?
            .first(where: { $0.name == "ref" })?
            .value
    }

    public var fileRootURL: URL? {
        guard let userID, let repositoryName, let branchName else {
            return nil
        }
        return URL(string: "https://raw.githubusercontent.com/\(userID)/\(repositoryName)/\(branchName)/")
    }

    public var fileType: FileType {
        guard let fileExtension = name?.split(separator: ".").last else {
            return .unknown
        }
        for fileType in FileType.allCases where fileType.extensions.contains(String(fileExtension)) {
            return fileType
        }
        return .unknown
    }

    enum CodingKeys: String, CodingKey {
        case name
        case path
        case sha
        case size
        case url
        case htmlURL = "html_url"
        case gitURL = "git_url"
        case downloadURL = "download_url"
        case type
        case encoding
        case content
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String.self, forKey: .name)
        path = try? container.decode(String.self, forKey: .path)
        sha = try? container.decode(String.self, forKey: .sha)
        size = try? container.decode(Int.self, forKey: .size)
        url = try? container.decode(String.self, forKey: .url)
        htmlURL = try? container.decode(String.self, forKey: .htmlURL)
        gitURL = try? container.decode(String.self, forKey: .gitURL)
        downloadURL = try? container.decode(String.self, forKey: .downloadURL)
        type = try? container.decode(String.self, forKey: .type)
        encoding = try? container.decode(String.self, forKey: .encoding)
        if let content = try? container.decode(String.self, forKey: .content) {
            let encodedContent = content.replacingOccurrences(of: "\n", with: "")
            self.content = String(
                data: Data(base64Encoded: encodedContent, options: [])!,
                encoding: .utf8
            )!
        }
    }

    public init() {}

    public func makeHTML(supportedEmojis: [GitHubEmoji]) async throws -> String? {
        guard let readMeHTML = try await renderHTML() else {
            return nil
        }
        let normalizedReadMeHTML = normalizeEmojisInHTML(readMeHTML, supportedEmojis: supportedEmojis)
        guard let parsedHTML = try? SwiftSoup.parse(normalizedReadMeHTML) else {
            return normalizedReadMeHTML
        }

        guard let blobToRawRegex = try? NSRegularExpression(
            pattern: "(https://github.com/[^/]+/[^/]+/)blob(/.+)",
            options: []
        ) else {
            assertionFailure()
            return normalizedReadMeHTML
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
                          let baseURL = fileRootURL,
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
        return try? parsedHTML.body()?.html()
    }

    private func normalizeEmojisInHTML(_ readMeHTML: String, supportedEmojis: [GitHubEmoji]) -> String {
        var normalized = readMeHTML
        for emoji in supportedEmojis {
            let target = ":" + emoji.id + ":"
            normalized = normalized.replacingOccurrences(of: target, with: emoji.html)
        }
        return normalized
    }

    private func renderHTML() async throws -> String? {
        guard let content else {
            return nil
        }
        let html: String?
        switch fileType {
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
            return "<img alt='\(id)' src='\(url.absoluteString)' />"
        }
    }
}
