//
//  GitHubEmoji.swift
//  
//
//  Created by Manabu Nakazawa on 21/8/21.
//

import Foundation

public struct GitHubEmoji {
    public enum ValueType {
        case text(String)
        case image(URL)
    }
    public var id: String
    public var value: ValueType
}

public extension APIEmojiList {
    func makeEmojis() -> [GitHubEmoji] {
        return value.compactMap { key, value -> GitHubEmoji? in
            guard let fallbackURL = URL(string: value) else {
                assertionFailure()
                return nil
            }
            var unicodeStrings = fallbackURL.deletingPathExtension().lastPathComponent
                .split(separator: "-")
            if unicodeStrings.count == 1 && unicodeStrings.first == "2764" {
                // Select ❤️ rather than ❤︎
                unicodeStrings.append("FE0F")
            }

            let unicodeScalars = unicodeStrings
                .compactMap { unicodeString -> Unicode.Scalar? in
                    guard let hex = UInt32(unicodeString, radix: 16),
                          let scalar = Unicode.Scalar(hex)
                    else {
                        return nil
                    }
                    return scalar
                }
            let value: GitHubEmoji.ValueType = unicodeScalars.isEmpty
                ? .image(fallbackURL)
                : .text(String.UnicodeScalarView(unicodeScalars).description)
            return GitHubEmoji(id: key, value: value)
        }
    }
}
