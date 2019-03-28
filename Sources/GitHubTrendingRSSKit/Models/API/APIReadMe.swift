//
//  Created by Manabu Nakazawa on 17/3/19.
//  
//

import Foundation

public struct APIReadMe: Codable {
    public var name: String?
    public var path: String?
    public var sha: String?
    public var size: Int?
    public var url: String?
    public var htmlURL: String?
    public var gitURL: String?
    public var downloadURL: String?
    public var type: String?
    public lazy var content: String? = {
        guard let encodedContent = _content?.replacingOccurrences(of: "\n", with: "") else {
            return nil
        }
        return String(
            data: Data(base64Encoded: encodedContent, options: [])!,
            encoding: .utf8)!
    }()
    private var _content: String?
    public var encoding: String?
    
    public var userID: String?
    public var repositoryName: String?
    
    public var branchName: String? {
        guard let url = url, let urlComponents = URLComponents(string: url) else {
            return nil
        }
        return urlComponents
            .queryItems?
            .first(where: { $0.name == "ref" })?
            .value
    }

    public var fileRootURL: URL? {
        guard let userID = userID, let repositoryName = repositoryName, let branchName = branchName else {
            return nil
        }
        return URL(string: "https://raw.githubusercontent.com/\(userID)/\(repositoryName)/\(branchName)/")
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
        case _content = "content"
        case encoding
    }

    public init() {}
}
