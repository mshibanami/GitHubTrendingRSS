// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import XCTest
import class Foundation.Bundle
import GitHubTrendingRSSKit

final class GitHubPageParserTests: XCTestCase {
    let parser = GitHubPageParser()

    func testParsePeriodSpecifiedTrendingPageLinks() throws {
        let topTrendingPage = TestResources.trendingPage(of: .top)

        let languageTrendingLinks = try parser
            .languageTrendingLinks(fromTopTrendingPage: topTrendingPage)

        XCTAssertEqual(languageTrendingLinks.count, 578)
        let firstTrendingLink = languageTrendingLinks.first!
        XCTAssertEqual(firstTrendingLink.name, "all")
        XCTAssertEqual(firstTrendingLink.displayName, "All Languages")
        XCTAssertEqual(firstTrendingLink.url(ofPeriod: .daily).absoluteString, "https://github.com/trending?since=daily")
        XCTAssertEqual(firstTrendingLink.href, "/trending")
    }

    func testParse() throws {
        let swiftTrendingPage = TestResources.trendingPage(of: .language(name: "swift"))
        let repositories = try parser.repositories(fromTrendingPage: swiftTrendingPage)
        XCTAssertEqual(repositories.count, 25)
        let repository = repositories.first!
        XCTAssertEqual(repository.pageLink.repositoryName, "open-source-ios-apps")
        XCTAssertEqual(repository.pageLink.href, "/dkhamsing/open-source-ios-apps")
        XCTAssertEqual(repository.summary, "📱 Collaborative List of Open-Source iOS Apps")
    }
}
