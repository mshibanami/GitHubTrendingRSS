// Copyright (c) 2019 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import XCTest

// TODO: refactor after https://bugs.swift.org/browse/SR-2866 was solved
class TestResources {
    static var rootURL: URL {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("TestResources")
        
        guard url.hasDirectoryPath else {
            fatalError("Test resources folder doesn't exist: \(url.absoluteString)")
        }
        
        return url
    }
    
    static func topTrendingPage() -> String {
        return try! String(
            contentsOf: rootURL.appendingPathComponent("github.com_trending.html"),
            encoding: .utf8)
    }
}
