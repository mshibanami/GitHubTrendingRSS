// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import GitHubTrendingRSSKit
import PathKit
import Stencil
import XCTest

final class SiteGeneratorTests: XCTestCase {
    private let environment = Environment(
        loader: FileSystemLoader(paths: [Path(Const.resourcesRootURL.path)])
    )
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
        var repoWithOpenGraph = Repository(
            pageLink: RepositoryPageLink(href: "hello/world"), summary: "hello world"
        )
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
        XCTAssertTrue(
            html.contains(
                "<media:content url=\"https://example.com/hello-world.png\" medium=\"image\" />"
            )
        )
    }

    func testGenerateRSSForAllLanguagesOmitsAllLanguagesInTitle() async throws {
        let rss = try await maker.makeRSS(
            from: LanguageTrendingLink(
                displayName: "All Languages", href: Const.gitHubTopTrendingURL.path
            ),
            period: .daily,
            repositories: [],
            supportedEmojis: supportedEmojis
        )
        XCTAssertTrue(rss.contains("<title>GitHub Daily Trending Repositories</title>"))
        XCTAssertTrue(rss.contains("<description>Daily Trending Repositories on GitHub</description>"))
        XCTAssertFalse(rss.contains("All Languages"))
    }

    func testGenerateRSSEscapesOpenGraphImageURLForXML() async throws {
        var repository = Repository(
            pageLink: RepositoryPageLink(href: "hello/world"), summary: "hello world"
        )
        repository.openGraphImageUrl = URL(
            string: "https://example.com/image.png?width=1200&height=630"
        )

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
        let dev = try Developer(
            username: "testuser",
            displayName: "Test User",
            avatarURL: URL(string: "https://avatars.githubusercontent.com/u/1234?v=4"),
            popularRepository: DeveloperPopularRepository(
                name: "cool-repo", href: "/testuser/cool-repo", summary: "cool summary",
                stargazerCount: 1_234
            ),
            pinnedRepositories: [
                DeveloperPinnedRepository(
                    name: "cool-repo", url: XCTUnwrap(URL(string: "https://github.com/testuser/cool-repo")),
                    summary: "duplicate pinned description", stargazerCount: 1_234
                ),
                DeveloperPinnedRepository(
                    name: "pinned-repo",
                    url: XCTUnwrap(URL(string: "https://github.com/testuser/pinned-repo")),
                    summary: "pinned description", stargazerCount: 99
                ),
            ],
            isSponsorable: true,
            bio: "Developer bio",
            company: "Test Corp",
            location: "Tokyo",
            followersCount: 1_200,
            followingCount: 63,
            publicReposCount: 15,
            websiteURL: URL(string: "https://test.com"),
            twitterUsername: "test_tw",
            email: "test@example.com"
        )

        let xml = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(displayName: "Swift", href: "/trending/swift"),
            period: .daily,
            developers: [dev],
            supportedEmojis: supportedEmojis
        )

        XCTAssertTrue(xml.contains("Test User (@testuser)"))
        XCTAssertTrue(xml.contains("https://github.com/testuser"))
        XCTAssertTrue(xml.contains("cool-repo"))
        XCTAssertTrue(xml.contains("pinned-repo"))
        XCTAssertTrue(xml.contains("assets/icons/star.png"))
        XCTAssertTrue(xml.contains("1234"))
        XCTAssertTrue(xml.contains("99"))
        XCTAssertFalse(xml.contains("⭐️"))
        XCTAssertFalse(xml.contains("duplicate pinned description"))
        XCTAssertTrue(xml.contains("https://x.com/test_tw"))
        XCTAssertTrue(xml.contains("mailto:test@example.com"))
        XCTAssertTrue(xml.contains("test@example.com"))
        XCTAssertTrue(xml.contains("assets/icons/mail.png"))
        XCTAssertTrue(xml.contains("assets/icons/building.png"))
        XCTAssertTrue(xml.contains("assets/icons/map-pin.png"))
        XCTAssertFalse(xml.contains("https://github.com/testuser?tab=followers"))
        XCTAssertFalse(xml.contains("https://github.com/testuser?tab=following"))
        XCTAssertTrue(xml.contains("&lt;strong&gt;1.2k&lt;/strong&gt; followers"))
        XCTAssertTrue(xml.contains("&lt;strong&gt;63&lt;/strong&gt; following"))
        XCTAssertFalse(xml.contains("1,200 followers"))
        XCTAssertFalse(xml.contains("assets/icons/users-round.png"))
        let statsRange = try XCTUnwrap(xml.range(of: "&lt;strong&gt;1.2k&lt;/strong&gt; followers"))
        let popularRepositoryRange = try XCTUnwrap(xml.range(of: "Popular Repository"))
        XCTAssertLessThan(statsRange.lowerBound, popularRepositoryRange.lowerBound)
        XCTAssertTrue(xml.contains("assets/icons/twitter.png"))
        XCTAssertTrue(XMLParser(data: Data(xml.utf8)).parse())
    }

    func testMakeDeveloperRSSLinkifiesMentionsAndTwitter() async throws {
        let dev = Developer(
            username: "john",
            displayName: "John Doe",
            avatarURL: nil,
            popularRepository: nil,
            bio: "Engineer @prisma and @facebook",
            company: "@google",
            twitterUsername: "john_tw"
        )

        let xml = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(displayName: "Swift", href: "/trending/swift"),
            period: .daily,
            developers: [dev],
            supportedEmojis: supportedEmojis
        )

        XCTAssertTrue(
            xml.contains("&lt;a href=&quot;https://github.com/prisma&quot;&gt;@prisma&lt;/a&gt;")
        )
        XCTAssertTrue(
            xml.contains("&lt;a href=&quot;https://github.com/facebook&quot;&gt;@facebook&lt;/a&gt;")
        )
        XCTAssertTrue(
            xml.contains("&lt;a href=&quot;https://github.com/google&quot;&gt;@google&lt;/a&gt;")
        )
        XCTAssertTrue(
            xml.contains("&lt;a href=&quot;https://x.com/john_tw&quot;&gt;@john_tw&lt;/a&gt;")
        )
        XCTAssertTrue(XMLParser(data: Data(xml.utf8)).parse())
    }

    func testMakeDeveloperRSSExpandsGitHubEmojiShortcodesInDescriptions() async throws {
        let dev = try Developer(
            username: "emoji-dev",
            displayName: "Emoji Dev",
            avatarURL: nil,
            popularRepository: DeveloperPopularRepository(
                name: "popular",
                href: "/emoji-dev/popular",
                summary: "Popular :fast_forward:"
            ),
            pinnedRepositories: [
                DeveloperPinnedRepository(
                    name: "pinned",
                    url: XCTUnwrap(URL(string: "https://github.com/emoji-dev/pinned")),
                    summary: "Pinned :fast_forward:",
                    stargazerCount: nil
                ),
            ],
            bio: "Bio :fast_forward:",
            company: "Company :fast_forward:",
            location: "Location :fast_forward:"
        )

        let xml = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(displayName: "Swift", href: "/trending/swift"),
            period: .daily,
            developers: [dev],
            supportedEmojis: supportedEmojis
        )

        XCTAssertFalse(xml.contains(":fast_forward:"))
        XCTAssertEqual(xml.components(separatedBy: "⏩").count - 1, 5)
        XCTAssertTrue(XMLParser(data: Data(xml.utf8)).parse())
    }

    func testMakeDeveloperRSSRendersSocialAccountsWithPNGAssetURL() async throws {
        let xURL = try XCTUnwrap(URL(string: "https://x.com/sampleuser"))
        let youtubeURL = try XCTUnwrap(URL(string: "https://youtube.com/@sample_channel"))
        let linkedinURL = try XCTUnwrap(URL(string: "https://www.linkedin.com/in/sampleuser"))
        let orcidURL = try XCTUnwrap(URL(string: "https://orcid.org/0000-0000-0000-0000"))
        let dev = Developer(
            username: "sampleuser",
            displayName: "Sample User",
            avatarURL: nil,
            popularRepository: nil,
            socialAccounts: [
                SocialAccount(provider: "X", url: xURL, displayName: "@sampleuser"),
                SocialAccount(provider: "YOUTUBE", url: youtubeURL, displayName: "@sample_channel"),
                SocialAccount(provider: "LINKEDIN", url: linkedinURL, displayName: "in/sampleuser"),
                SocialAccount(provider: "ORCID", url: orcidURL, displayName: "0000-0000-0000-0000"),
            ]
        )

        let xml = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(
                displayName: "All Languages", href: Const.gitHubTopTrendingURL.path
            ),
            period: .daily,
            developers: [dev],
            supportedEmojis: supportedEmojis
        )

        XCTAssertTrue(xml.contains("x.com"))
        XCTAssertTrue(xml.contains("youtube.com"))
        XCTAssertTrue(xml.contains("linkedin.com"))
        XCTAssertTrue(xml.contains("orcid.org"))
        XCTAssertTrue(xml.contains("assets/icons/twitter.png"))
        XCTAssertTrue(xml.contains("assets/icons/youtube.png"))
        XCTAssertTrue(xml.contains("assets/icons/linkedin.png"))
        XCTAssertTrue(xml.contains("assets/icons/orcid.png"))
        XCTAssertFalse(xml.contains("assets/icons/twitter.svg"))
        XCTAssertFalse(xml.contains("assets/icons/youtube.svg"))
        XCTAssertFalse(xml.contains("assets/icons/linkedin.svg"))
        XCTAssertFalse(xml.contains("assets/icons/orcid.svg"))
        XCTAssertTrue(xml.contains("width=&quot;20&quot; height=&quot;20&quot;"))
        XCTAssertTrue(xml.contains("vertical-align: middle;"))
        XCTAssertTrue(XMLParser(data: Data(xml.utf8)).parse())
    }

    func testMakeDeveloperRSSUsesGenericLinkIconForUnknownSocialDomain() async throws {
        let websiteURL = try XCTUnwrap(URL(string: "https://custom-domain.example.com"))
        let blogURL = try XCTUnwrap(URL(string: "https://myblog.example.org"))
        let dev = Developer(
            username: "generic_dev",
            displayName: "Generic Dev",
            avatarURL: nil,
            popularRepository: nil,
            websiteURL: websiteURL,
            socialAccounts: [
                SocialAccount(provider: "GENERIC", url: blogURL, displayName: "My Blog"),
            ]
        )

        let xml = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(
                displayName: "All Languages", href: Const.gitHubTopTrendingURL.path
            ),
            period: .daily,
            developers: [dev],
            supportedEmojis: supportedEmojis
        )

        XCTAssertTrue(xml.contains("custom-domain.example.com"))
        XCTAssertTrue(xml.contains("myblog.example.org"))
        XCTAssertTrue(xml.contains("assets/icons/link.png"))
        XCTAssertFalse(xml.contains("assets/icons/link.svg"))
        XCTAssertTrue(XMLParser(data: Data(xml.utf8)).parse())
    }

    func testMakeDeveloperRSSEscapesSpecialCharacters() async throws {
        let dev = Developer(
            username: "user_special",
            displayName: "Bob & Alice <Devs>",
            avatarURL: URL(string: "https://avatars.githubusercontent.com/u/1234?v=4&s=96"),
            popularRepository: DeveloperPopularRepository(
                name: "repo & <tool>", href: "/user_special/repo", summary: "summary & <desc>"
            ),
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

        XCTAssertTrue(
            XMLParser(data: Data(xml.utf8)).parse(),
            "Generated Developer RSS XML with special characters should be valid XML"
        )
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

    func testMakeDeveloperRSSForAllLanguagesOmitsAllLanguagesInTitle() async throws {
        let xml = try await maker.makeDeveloperRSS(
            from: LanguageTrendingLink(
                displayName: "All Languages", href: Const.gitHubTopTrendingURL.path
            ),
            period: .daily,
            developers: [],
            supportedEmojis: supportedEmojis
        )

        XCTAssertTrue(xml.contains("<title>GitHub Daily Trending Developers</title>"))
        XCTAssertTrue(xml.contains("<description>Daily Trending Developers on GitHub</description>"))
        XCTAssertFalse(xml.contains("All Languages"))
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
        devWithGraphQL.pinnedRepositories = try [
            DeveloperPinnedRepository(
                name: "pinned1", url: XCTUnwrap(URL(string: "https://github.com/user1/pinned1")),
                summary: "desc", stargazerCount: 10
            ),
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
