// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import GitHubTrendingRSSKit
import PathKit
import Stencil
import XCTest

final class SiteGeneratorTests: XCTestCase {
    private let environment = Environment(loader: FileSystemLoader(paths: [Path(Const.resourcesRootURL.path)]))
    private let information = SiteSourceMaker.Information(
        pageTitle: "page title",
        author: "spring water",
        rssHomeURL: "rss home url",
        googleAnalyticsTrackingCode: "141421356",
        gitHubRepositoryURL: "github repository url"
    )

    private var maker: SiteSourceMaker!
    private let supportedEmojis = TestResources.supportedEmojis()

    override func setUp() async throws {
        try await super.setUp()
        try await DocslothManager.shared.setup()
        maker = SiteSourceMaker(
            environment: environment,
            information: information
        )
    }

    func testGenerateRSSListHTML() throws {
        let html = try maker.makeHomeHTML(from: [
            LanguageTrendingLink(displayName: "Hello", href: "/mshibanami/hello"),
            LanguageTrendingLink(displayName: "World", href: "/mshibanami/world"),
        ])

        XCTAssertTrue(html.contains(information.pageTitle))
        XCTAssertTrue(html.contains(information.author))
        XCTAssertTrue(html.contains(information.rssHomeURL))
        XCTAssertTrue(html.contains(information.googleAnalyticsTrackingCode))
        XCTAssertTrue(html.contains(information.gitHubRepositoryURL))
    }

    func testGenerateRSS() async throws {
        var repoWithOpenGraph = Repository(pageLink: RepositoryPageLink(href: "hello/world"), summary: "hello world")
        repoWithOpenGraph.openGraphImageUrl = URL(string: "https://example.com/hello-world.png")
        let html = try await maker.makeRSS(
            from: LanguageTrendingLink(displayName: "My Lang", href: "/my/lang"),
            period: .weekly,
            repositories: [
                repoWithOpenGraph,
                Repository(pageLink: RepositoryPageLink(href: "foo/bar"), summary: "foo bar"),
            ], supportedEmojis: supportedEmojis
        )
        XCTAssertTrue(html.contains("hello-world.png"))
        XCTAssertTrue(html.contains("<media:content url=\"https://example.com/hello-world.png\" medium=\"image\" />"))
    }

    func testGenerateRSSEscapesOpenGraphImageURLForXML() async throws {
        var repository = Repository(pageLink: RepositoryPageLink(href: "hello/world"), summary: "hello world")
        repository.openGraphImageUrl = URL(string: "https://example.com/image.png?width=1200&height=630")

        let rss = try await maker.makeRSS(
            from: LanguageTrendingLink(displayName: "My Lang", href: "/my/lang"),
            period: .daily,
            repositories: [repository],
            supportedEmojis: supportedEmojis
        )

        XCTAssertTrue(rss.contains("https://example.com/image.png?width=1200&amp;height=630"))
        XCTAssertTrue(XMLParser(data: Data(rss.utf8)).parse())
    }

    func testGenerateRSSRemovesInvalidXML10CharactersFromDescription() async throws {
        let repository = Repository(
            pageLink: RepositoryPageLink(href: "hello/world"),
            summary: "before\u{0013}\u{0016}after"
        )

        let rss = try await maker.makeRSS(
            from: LanguageTrendingLink(displayName: "My Lang", href: "/my/lang"),
            period: .daily,
            repositories: [repository],
            supportedEmojis: supportedEmojis
        )

        XCTAssertFalse(rss.contains("\u{0013}"))
        XCTAssertFalse(rss.contains("\u{0016}"))
        XCTAssertTrue(XMLParser(data: Data(rss.utf8)).parse())
    }

    func testGenerateRSSWithSpokenLanguage() async throws {
        let html = try await maker.makeRSS(
            from: LanguageTrendingLink(displayName: "Swift", href: "/swift"),
            period: .daily,
            spokenLanguage: .en,
            repositories: [
                Repository(pageLink: RepositoryPageLink(href: "foo/bar"), summary: "foo bar"),
            ],
            supportedEmojis: supportedEmojis
        )
        XCTAssertFalse(html.isEmpty)
    }

    func testMakeDeveloperRSS() async throws {
        let dev = Developer(
            username: "testuser",
            displayName: "Test User",
            avatarURL: URL(string: "https://avatars.githubusercontent.com/u/1234?v=4"),
            popularRepository: DeveloperPopularRepository(name: "cool-repo", href: "/testuser/cool-repo", summary: "cool summary"),
            pinnedRepositories: [
                DeveloperPinnedRepository(name: "pinned-repo", url: URL(string: "https://github.com/testuser/pinned-repo")!, summary: "pinned description", stargazerCount: 99)
            ],
            isSponsorable: true,
            bio: "Developer bio",
            company: "Test Corp",
            location: "Tokyo",
            followersCount: 50,
            publicReposCount: 15,
            websiteURL: URL(string: "https://test.com"),
            twitterUsername: "test_tw"
        )

        let xml = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(displayName: "Swift", href: "/trending/swift"),
            period: .daily,
            developers: [dev],
            supportedEmojis: supportedEmojis
        )

        XCTAssertTrue(xml.contains("Test User (testuser)"))
        XCTAssertTrue(xml.contains("https://github.com/testuser"))
        XCTAssertTrue(xml.contains("cool-repo"))
        XCTAssertTrue(xml.contains("pinned-repo"))
        XCTAssertTrue(xml.contains("Sponsorable"))
        XCTAssertTrue(XMLParser(data: Data(xml.utf8)).parse())
    }

    func testMakeDeveloperRSSEscapesSpecialCharacters() async throws {
        let dev = Developer(
            username: "user_special",
            displayName: "Bob & Alice <Devs>",
            avatarURL: URL(string: "https://avatars.githubusercontent.com/u/1234?v=4&s=96"),
            popularRepository: DeveloperPopularRepository(name: "repo & <tool>", href: "/user_special/repo", summary: "summary & <desc>"),
            bio: "Bio with & and <tag>",
            company: "Acme & Co <HQ>",
            location: "Tokyo & Kyoto"
        )

        let xml = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(displayName: "Swift", href: "/trending/swift"),
            period: .daily,
            developers: [dev],
            supportedEmojis: supportedEmojis
        )

        XCTAssertTrue(XMLParser(data: Data(xml.utf8)).parse(), "Generated Developer RSS XML with special characters should be valid XML")
    }

    func testMakeDeveloperRSSWithEmptyDevelopers() async throws {
        let xml = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(displayName: "Swift", href: "/trending/swift"),
            period: .daily,
            developers: [],
            supportedEmojis: supportedEmojis
        )

        XCTAssertTrue(xml.contains("<title>GitHub Swift Daily Trending Developers</title>"))
        XCTAssertTrue(XMLParser(data: Data(xml.utf8)).parse())
    }

    func testMakeDeveloperRSSReflectsGraphQLMetadataChangesInCache() async throws {
        let devWithoutGraphQL = Developer(
            username: "user1",
            displayName: "User One",
            avatarURL: nil,
            popularRepository: nil
        )

        let xml1 = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(displayName: "Swift", href: "/trending/swift"),
            period: .daily,
            developers: [devWithoutGraphQL],
            supportedEmojis: supportedEmojis
        )
        XCTAssertFalse(xml1.contains("Pinned Repositories"))

        var devWithGraphQL = devWithoutGraphQL
        devWithGraphQL.pinnedRepositories = [
            DeveloperPinnedRepository(name: "pinned1", url: URL(string: "https://github.com/user1/pinned1")!, summary: "desc", stargazerCount: 10)
        ]

        let xml2 = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(displayName: "Swift", href: "/trending/swift"),
            period: .daily,
            developers: [devWithGraphQL],
            supportedEmojis: supportedEmojis
        )
        XCTAssertTrue(xml2.contains("Pinned Repositories"))
        XCTAssertTrue(xml2.contains("pinned1"))
    }
}

