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
    public var content: String?
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
        case content
        case encoding
    }
    
    public init() {}
    
    public var decodedContent: String? {
        guard let content = content?.replacingOccurrences(of: "\n", with: "") else {
            return nil
        }
        return String(
            data: Data(base64Encoded: content, options: [])!,
            encoding: .utf8)!
    }
}
