//
//  Created by Manabu Nakazawa on 17/3/19.
//
//

import Foundation

public struct APIReadMe: Codable {
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
}
