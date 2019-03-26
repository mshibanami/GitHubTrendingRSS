// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit
import XCTest

final class ModelsTests: XCTestCase {

    func testRepository() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary")
        repository1.readMe = APIReadMe()
        let html = repository1.createFeedEntryHTML()
        let repoURL = "https://github.com/user/repo"
        XCTAssertTrue(html.contains("<link>\(repoURL)</link>"))
        XCTAssertEqual(repository1.imageURLs().count, 0)

        var repository2 = Repository(
            pageLink: RepositoryPageLink(href: ""),
            summary: "")
        var readMe2 = APIReadMe()
        readMe2.downloadURL = "http://abc.def/"
        readMe2.content = """
        <img align="right" src="./foo/bar.png" />
        """
        repository2.readMe = readMe2
        let imageURLs2 = repository2.imageURLs()
        XCTAssertEqual(imageURLs2.first?.absoluteString, "http://abc.def/foo/bar.png")

        var repository3 = Repository(
            pageLink: RepositoryPageLink(href: ""),
            summary: "")
        var readMe3 = APIReadMe()
        readMe3.content = """
        ![foo](/foo/bar.png)
        """
        repository3.readMe = readMe3
        let imageURLs3 = repository3.imageURLs()
        XCTAssertEqual(imageURLs3.first?.absoluteString, "/foo/bar.png")
        
        var repository4 = Repository(
            pageLink: RepositoryPageLink(href: ""),
            summary: "")
        var readMe4 = APIReadMe()
        readMe4.downloadURL = "http://abc.def/"
        readMe4.content = """
        ![foo](/foo/bar.png)
        """
        repository4.readMe = readMe4
        let imageURLs4 = repository4.imageURLs()
        XCTAssertEqual(imageURLs4.first?.absoluteString, "http://abc.def/foo/bar.png")
    }
}
