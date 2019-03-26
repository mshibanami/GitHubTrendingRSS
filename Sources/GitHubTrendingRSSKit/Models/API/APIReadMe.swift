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
