// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit
import XCTest

final class ModelsTests: XCTestCase {
    
    func testRepository() throws {
        let link = RepositoryPageLink(href: "/user/repo")
        
        var repository = Repository(
            pageLink: link,
            summary: "dummy summary")
        var readMe = APIReadMe()
        readMe.content = "SGVsbG8gV29ybGQ="
        repository.readMe = readMe
        
        let html = repository.createFeedEntryHTML()
        let repoURL = "https://github.com/user/repo"
        XCTAssertTrue(html.contains("<link>\(repoURL)</link>"))
    }
    
    func testReadMe() throws {
        var readMe1 = APIReadMe()
        readMe1.content = "SGVsbG8gV29ybGQ="
        XCTAssertEqual(readMe1.decodedContent, "Hello World")
        
        var readMe2 = APIReadMe()
        readMe2.content = "SGVsbG8g\nV29ybGQ="
        XCTAssertEqual(readMe2.decodedContent, "Hello World")
    }
    
    func testGenerateRssListHTML() throws {
        let links = [LanguageTrendingLink(displayName: "Hello", href: "/hello?since=weekly"),
                     LanguageTrendingLink(displayName: "World", href: "/world?since=weekly") ]
        
        let generated = links.rssListHTML()
    }
}
