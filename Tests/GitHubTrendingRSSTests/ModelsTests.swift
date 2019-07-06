// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit
import XCTest

final class ModelsTests: XCTestCase {
    func testNormalRepository() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary")
        repository1.readMe = APIReadMe()
        let html = repository1.createFeedEntryHTML()
        XCTAssertTrue(html.contains("<link>https://github.com/user/repo</link>"))
        XCTAssertEqual(repository1.readMeHTML(), nil)
    }

    func testSanitizedSVGImage1() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary")
        repository1.readMe = APIReadMe()
        repository1.readMe?.userID = "user"
        repository1.readMe?.repositoryName = "repo"
        repository1.readMe?.url = "https://api.github.com/repos/user/repo/contents/README.md?ref=master"
        repository1.readMe!.content = "![hi](/world.svg)"
        let html = repository1.readMeHTML()!
        XCTAssertTrue(html.contains("https://raw.githubusercontent.com/user/repo/master/world.svg?sanitize=true"))
    }

    func testRootURL() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary")
        repository1.readMe = APIReadMe()
        repository1.readMe?.userID = "user"
        repository1.readMe?.repositoryName = "repo"
        repository1.readMe?.url = "https://api.github.com/repos/user/repo/contents/README.md?ref=master"
        repository1.readMe?.content = "[hello](/world.jpg)"
        let html = repository1.readMeHTML()!
        XCTAssertTrue(html.contains("https://raw.githubusercontent.com/user/repo/master/world.jpg"))
    }

    func testSanitizedSVGIsAppliedOnlyForImage() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary")
        repository1.readMe = APIReadMe()
        repository1.readMe?.userID = "user"
        repository1.readMe?.repositoryName = "repo"
        repository1.readMe?.url = "https://api.github.com/repos/user/repo/contents/README.md?ref=master"
        repository1.readMe!.content = "[hi](hello.svg)"
        let html = repository1.readMeHTML()!
        XCTAssertTrue(html.contains(#""https://raw.githubusercontent.com/user/repo/master/hello.svg""#))
    }
}
