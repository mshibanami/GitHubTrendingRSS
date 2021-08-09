// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Combine
import Down
import Foundation
import GitHubTrendingRSSKit
import XCTest

final class ModelsTests: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []

    func testNormalRepository() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary")
        repository1.readMe = APIReadMe()
        XCTAssertEqual(repository1.makeReadMeHTML(includesSummary: false), nil)
    }

    func testRepositoryIncludingBlobImage() throws {
        var repo = Repository(
            pageLink: RepositoryPageLink(href: "/uber/ribs"),
            summary: "Uber's cross-platform mobile architecture framework.")
        repo.readMe = try JSONDecoder().decode(APIReadMe.self, from: TestResources.getData(ofFileName: "api.github.com_uber_ribs_readme.json"))
        repo.readMe?.userID = "uber"
        repo.readMe?.repositoryName = "ribs"

        let html = repo.makeReadMeHTML(includesSummary: true)!
        XCTAssertTrue(html.contains("https://github.com/uber/ribs/raw/assets/rib_horizontal_black.png"))
        XCTAssertTrue(!html.contains("https://github.com/uber/ribs/blob/assets/rib_horizontal_black.png"))
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
        let html = repository1.makeReadMeHTML(includesSummary: true)!
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
        let html = repository1.makeReadMeHTML(includesSummary: true)!
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
        let html = repository1.makeReadMeHTML(includesSummary: true)!
        XCTAssertTrue(html.contains(#""https://raw.githubusercontent.com/user/repo/master/hello.svg""#))
    }
}
