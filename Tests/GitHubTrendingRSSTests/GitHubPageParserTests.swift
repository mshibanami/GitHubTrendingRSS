// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import XCTest
import class Foundation.Bundle
import GitHubTrendingRSSKit

final class GitHubPageParserTests: XCTestCase {
    let parser = GitHubPageParser()

    func testParsePeriodSpecifiedTrendingPageLinks() throws {
        let pageLinks = try parser
            .periodSpecifiedTrendingPageLinks(fromTopTrendingPage: TestResources.normalTopTrendingPage)
        XCTAssertEqual(pageLinks.count, 3)

        let languageTrendingLinks = try parser
            .languageTrendingLinks(fromTrendingPage: TestResources.normalTopTrendingPage)

        XCTAssertEqual(languageTrendingLinks.count, 480)
        let firstTrendingLink = languageTrendingLinks.first!
        XCTAssertEqual(firstTrendingLink.name, "1c-enterprise")
        XCTAssertEqual(firstTrendingLink.displayName, "1C Enterprise")
        XCTAssertEqual(firstTrendingLink.url(ofPeriod: .daily).absoluteString, "https://github.com/trending/1c-enterprise?since=daily")
        XCTAssertEqual(firstTrendingLink.href, "/trending/1c-enterprise?since=daily")
    }

    static var allTests = [
        ("testParsePeriodSpecifiedTrendingPageLinks", testParsePeriodSpecifiedTrendingPageLinks)
    ]
}
