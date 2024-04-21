// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import class Foundation.Bundle
import GitHubTrendingRSSKit
import XCTest

final class GitHubPageParserTests: XCTestCase {
    let parser = GitHubPageParser()

    func testParsePeriodSpecifiedTrendingPageLinks() throws {
        let topTrendingPage = TestResources.trendingPage(of: .top)

        let languageTrendingLinks = try parser
            .languageTrendingLinks(fromTopTrendingPage: topTrendingPage)

        XCTAssertEqual(languageTrendingLinks.count, 726)
        let firstTrendingLink = languageTrendingLinks.first!
        XCTAssertEqual(firstTrendingLink.name, "all")
        XCTAssertEqual(firstTrendingLink.displayName, "All Languages")
        XCTAssertEqual(firstTrendingLink.url(ofPeriod: .daily).absoluteString, "https://github.com/trending?since=daily")
        XCTAssertEqual(firstTrendingLink.href, "/trending")
    }
    
    func testDuplicatedTrendingLinksOnTop() throws {
        let topTrendingPage = TestResources.trendingPage(of: .top)

        let languageTrendingLinks = try parser
            .languageTrendingLinks(fromTopTrendingPage: topTrendingPage)

        XCTAssertEqual(languageTrendingLinks.count, 726)
        let duplicates = languageTrendingLinks
            .map(\.name)
            .findDuplicates()
        XCTAssertEqual(duplicates, [])
    }

    func testParse() throws {
        let swiftTrendingPage = TestResources.trendingPage(of: .language(name: "swift"))
        let repositories = try parser.repositories(fromTrendingPage: swiftTrendingPage)
        XCTAssertEqual(repositories.count, 25)
        let repository = repositories.first!
        XCTAssertEqual(repository.pageLink.repositoryName, "lottie-ios")
        XCTAssertEqual(repository.pageLink.href, "/airbnb/lottie-ios")
        XCTAssertEqual(repository.summary, "An iOS library to natively render After Effects vector animations")
    }
}

extension Array where Element: Hashable {
    func findDuplicates() -> [Element] {
        var counts: [Element: Int] = [:]
        
        for element in self {
            counts[element, default: 0] += 1
        }
        
        let duplicates = counts
            .filter { $0.value > 1 }
            .map(\.key)
        return duplicates
    }
}
