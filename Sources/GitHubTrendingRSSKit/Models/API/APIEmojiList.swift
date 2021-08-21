//
//  File.swift
//  
//
//  Created by Manabu Nakazawa on 21/8/21.
//

import Foundation

/// For https://api.github.com/emojis
public struct APIEmojiList: Decodable {
    var value: [String: String]
    
    public init(from decoder: Decoder) throws {
        let dictionary = try decoder.singleValueContainer().decode([String: String].self)
        value = dictionary
    }
}
