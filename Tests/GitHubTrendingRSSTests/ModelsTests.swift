// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Combine
import Foundation
import GitHubTrendingRSSKit
import XCTest

final class ModelsTests: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    private let supportedEmojis = TestResources.supportedEmojis()

    func testNormalRepository() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary"
        )
        repository1.readMe = APIReadMe()
        XCTAssertEqual(repository1.makeReadMeHTML(includesSummary: false, supportedEmojis: supportedEmojis), nil)
    }

    func testRepositoryIncludingBlobImage() throws {
        var repo = Repository(
            pageLink: RepositoryPageLink(href: "/uber/ribs"),
            summary: "Uber's cross-platform mobile architecture framework."
        )
        repo.readMe = try JSONDecoder().decode(APIReadMe.self, from: TestResources.getData(ofFileName: "api.github.com_uber_ribs_readme.json"))
        repo.readMe?.userID = "uber"
        repo.readMe?.repositoryName = "ribs"

        let html = repo.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)!
        XCTAssertTrue(html.contains("https://github.com/uber/ribs/raw/assets/rib_horizontal_black.png"))
        XCTAssertTrue(!html.contains("https://github.com/uber/ribs/blob/assets/rib_horizontal_black.png"))
    }

    func testRepositoryIncludingTable() throws {
        var repo = Repository(
            pageLink: RepositoryPageLink(href: "/rook/rook"),
            summary: "Storage Orchestration for Kubernetes"
        )
        repo.readMe = try JSONDecoder().decode(APIReadMe.self, from: TestResources.getData(ofFileName: "api.github.com_rook_rook_readme.json"))
        repo.readMe?.userID = "rook"
        repo.readMe?.repositoryName = "rook"
        let html = repo.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)!
        XCTAssertTrue(html.contains("<table>"))
    }

    func testRepositoryIncludingGitHubEmoji() throws {
        var repo = Repository(
            pageLink: RepositoryPageLink(href: "/WebpageFX/emoji-cheat-sheet.com"),
            summary: "A one pager for emojis on Campfire and GitHub"
        )
        repo.readMe = try JSONDecoder().decode(APIReadMe.self, from: TestResources.getData(ofFileName: "api.github.com_WebpageFX_emoji-cheat-sheet.com_readme.json"))
        repo.readMe?.userID = "WebpageFX"
        repo.readMe?.repositoryName = "emoji-cheat-sheet.com"
        let html = repo.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)!
        XCTAssertTrue(html.contains("❤️"))
        XCTAssertTrue(html.contains("✨"))
    }

    func testAsciiDoc() throws {
        var repo = Repository(
            pageLink: RepositoryPageLink(href: "/spring-projects/spring-authorization-server"),
            summary: "A community-driven project led by the Spring Security team and is focused on delivering Authorization Server support to the Spring community"
        )
        repo.readMe = try JSONDecoder().decode(APIReadMe.self, from: TestResources.getData(ofFileName: "api.github.com_spring-projects_spring-authorization-server_readme.json"))
        repo.readMe?.userID = "spring-projects"
        repo.readMe?.repositoryName = "spring-authorization-server"
        let html = repo.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)!
        XCTAssertTrue(html.contains(#"<h1 id="_spring_authorization_server" class="sect0">Spring Authorization Server</h1>"#))
    }

    func testRepositoryIncludingCheckbox() throws {
        var repo = Repository(
            pageLink: RepositoryPageLink(href: "/blueedgetechno/windows11"),
            summary: "windows 11 in react 💻🌈⚡"
        )
        repo.readMe = try JSONDecoder().decode(APIReadMe.self, from: TestResources.getData(ofFileName: "api.github.com_blueedgetechno_windows11_readme.json"))
        repo.readMe?.userID = "blueedgetechno"
        repo.readMe?.repositoryName = "windows11"
        let html = repo.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)!
        XCTAssertTrue(html.contains(#"<input type="checkbox" checked disabled />"#))
        XCTAssertTrue(html.contains(#"<input type="checkbox" disabled />"#))
    }

    func testSanitizedSVGImage1() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary"
        )
        repository1.readMe = APIReadMe()
        repository1.readMe?.userID = "user"
        repository1.readMe?.repositoryName = "repo"
        repository1.readMe?.url = "https://api.github.com/repos/user/repo/contents/README.md?ref=master"
        repository1.readMe!.content = "![hi](/world.svg)"
        let html = repository1.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)!
        XCTAssertTrue(html.contains("https://raw.githubusercontent.com/user/repo/master/world.svg?sanitize=true"))
    }

    func testRootURL() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary"
        )
        repository1.readMe = APIReadMe()
        repository1.readMe?.userID = "user"
        repository1.readMe?.repositoryName = "repo"
        repository1.readMe?.url = "https://api.github.com/repos/user/repo/contents/README.md?ref=master"
        repository1.readMe?.content = "[hello](/world.jpg)"
        let html = repository1.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)!
        XCTAssertTrue(html.contains("https://raw.githubusercontent.com/user/repo/master/world.jpg"))
    }

    func testSanitizedSVGIsAppliedOnlyForImage() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary"
        )
        repository1.readMe = APIReadMe()
        repository1.readMe?.userID = "user"
        repository1.readMe?.repositoryName = "repo"
        repository1.readMe?.url = "https://api.github.com/repos/user/repo/contents/README.md?ref=master"
        repository1.readMe!.content = "[hi](hello.svg)"
        let html = repository1.makeReadMeHTML(includesSummary: true, supportedEmojis: supportedEmojis)!
        XCTAssertTrue(html.contains(#""https://raw.githubusercontent.com/user/repo/master/hello.svg""#))
    }
}
