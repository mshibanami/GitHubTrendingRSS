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

    override func setUp() {
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

    func testGenerateRSS() throws {
        let html = try maker.makeRSS(
            from: LanguageTrendingLink(displayName: "My Lang", href: "/my/lang"),
            period: .weekly,
            repositories: [
                Repository(pageLink: RepositoryPageLink(href: "hello/world"), summary: "hello world"),
                Repository(pageLink: RepositoryPageLink(href: "foo/bar"), summary: "foo bar"),
            ], supportedEmojis: supportedEmojis
        )
        print(html)
    }
}
