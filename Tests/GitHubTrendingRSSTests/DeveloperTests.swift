// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import XCTest
@testable import GitHubTrendingRSSKit

final class DeveloperTests: XCTestCase {
    override func setUp() async throws {
        try await super.setUp()
        try await DocslothManager.shared.setup()
    }

    func testDeveloperInitialization() throws {
        let popRepo = DeveloperPopularRepository(name: "repo", href: "/user/repo", summary: "summary")
        let pinnedRepo = try DeveloperPinnedRepository(
            name: "pinned", url: XCTUnwrap(URL(string: "https://github.com/user/pinned")),
            summary: "pinned summary", stargazerCount: 42
        )

        let developer = Developer(
            username: "user",
            displayName: "User Name",
            avatarURL: URL(string: "https://avatars.githubusercontent.com/u/1?v=4"),
            popularRepository: popRepo,
            pinnedRepositories: [pinnedRepo],
            isSponsorable: true,
            bio: "Bio",
            company: "Company",
            location: "Location",
            followersCount: 100,
            followingCount: 20,
            publicReposCount: 10,
            websiteURL: URL(string: "https://example.com"),
            twitterUsername: "user_twitter",
            profileReadMe: nil
        )

        XCTAssertEqual(developer.username, "user")
        XCTAssertEqual(developer.displayName, "User Name")
        XCTAssertEqual(
            developer.avatarURL?.absoluteString, "https://avatars.githubusercontent.com/u/1?v=4"
        )
        XCTAssertEqual(developer.popularRepository?.name, "repo")
        XCTAssertEqual(developer.pinnedRepositories.count, 1)
        XCTAssertEqual(developer.pinnedRepositories.first?.name, "pinned")
        XCTAssertEqual(developer.pinnedRepositories.first?.stargazerCount, 42)
        XCTAssertTrue(developer.isSponsorable)
        XCTAssertEqual(developer.bio, "Bio")
        XCTAssertEqual(developer.company, "Company")
        XCTAssertEqual(developer.location, "Location")
        XCTAssertEqual(developer.followersCount, 100)
        XCTAssertEqual(developer.followingCount, 20)
        XCTAssertEqual(developer.publicReposCount, 10)
        XCTAssertEqual(developer.websiteURL?.absoluteString, "https://example.com")
        XCTAssertEqual(developer.twitterUsername, "user_twitter")
    }

    func testDeveloperURLGeneration() {
        let allLink = LanguageTrendingLink(displayName: "All Languages", href: "/trending")
        XCTAssertEqual(
            allLink.developerURL(ofPeriod: .daily).absoluteString,
            "https://github.com/trending/developers?since=daily"
        )
        XCTAssertEqual(
            allLink.developerURL(ofPeriod: .weekly).absoluteString,
            "https://github.com/trending/developers?since=weekly"
        )

        let swiftLink = LanguageTrendingLink(displayName: "Swift", href: "/trending/swift")
        XCTAssertEqual(
            swiftLink.developerURL(ofPeriod: .daily).absoluteString,
            "https://github.com/trending/developers/swift?since=daily"
        )
        XCTAssertEqual(
            swiftLink.developerURL(ofPeriod: .monthly).absoluteString,
            "https://github.com/trending/developers/swift?since=monthly"
        )
    }

    func testMakeReadMeHTML() async throws {
        var readMe = APIReadMe()
        readMe.name = "README.md"
        readMe.path = "README.md"
        readMe.url = "https://api.github.com/repos/user/user/contents/README.md?ref=main"
        readMe.userID = "user"
        readMe.repositoryName = "user"
        // Content: "# Hello World :octocat:" encoded in base64
        let rawContent = "# Hello World :octocat:"
        readMe.content = rawContent

        let developer = Developer(
            username: "user",
            displayName: "User Name",
            avatarURL: nil,
            popularRepository: nil,
            profileReadMe: readMe
        )

        let html = try await developer.makeReadMeHTML(supportedEmojis: TestResources.supportedEmojis())
        XCTAssertNotNil(html)
        XCTAssertTrue(try XCTUnwrap(html?.contains("Hello World")))
        XCTAssertTrue(try XCTUnwrap(html?.contains("<img")) || html!.contains("octocat"))
    }

    func testMakeReadMeHTMLWithNilReadMeReturnsNil() async throws {
        let developer = Developer(
            username: "user",
            displayName: "User Name",
            avatarURL: nil,
            popularRepository: nil,
            profileReadMe: nil
        )
        let html = try await developer.makeReadMeHTML(supportedEmojis: TestResources.supportedEmojis())
        XCTAssertNil(html)
    }
}
