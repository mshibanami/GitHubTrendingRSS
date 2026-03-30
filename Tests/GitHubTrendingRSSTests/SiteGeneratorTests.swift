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
}
