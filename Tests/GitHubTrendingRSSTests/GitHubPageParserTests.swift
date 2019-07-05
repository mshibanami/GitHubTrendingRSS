// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import XCTest
import class Foundation.Bundle
import GitHubTrendingRSSKit

final class GitHubPageParserTests: XCTestCase {
    let parser = GitHubPageParser()
    
    func testParsePeriodSpecifiedTrendingPageLinks() throws {
        let topTrendingPage = TestResources.topTrendingPage()
        
        let pageLinks = try parser
            .periodSpecifiedTrendingPageLinks(fromTopTrendingPage: topTrendingPage)
        XCTAssertEqual(pageLinks.count, 3)

        let languageTrendingLinks = try parser
            .languageTrendingLinks(fromTopTrendingPage: topTrendingPage)

        XCTAssertEqual(languageTrendingLinks.count, 526)
        let firstTrendingLink = languageTrendingLinks.first!
        XCTAssertEqual(firstTrendingLink.name, "all")
        XCTAssertEqual(firstTrendingLink.displayName, "All Languages")
        XCTAssertEqual(firstTrendingLink.url(ofPeriod: .daily).absoluteString, "https://github.com/trending?since=daily")
        XCTAssertEqual(firstTrendingLink.href, "/trending")
    }
}
