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

        XCTAssertEqual(languageTrendingLinks.count, 720)
        let firstTrendingLink = try XCTUnwrap(languageTrendingLinks.first)
        XCTAssertEqual(firstTrendingLink.name, "all")
        XCTAssertEqual(firstTrendingLink.displayName, "All Languages")
        XCTAssertEqual(firstTrendingLink.url(ofPeriod: .daily).absoluteString, "https://github.com/trending?since=daily")
        XCTAssertEqual(firstTrendingLink.href, "/trending")
    }
    
    func testDuplicatedTrendingLinksOnTop() throws {
        let topTrendingPage = TestResources.trendingPage(of: .top)

        let languageTrendingLinks = try parser
            .languageTrendingLinks(fromTopTrendingPage: topTrendingPage)

        XCTAssertEqual(languageTrendingLinks.count, 720)
        let duplicates = languageTrendingLinks
            .map(\.name)
            .findDuplicates()
        XCTAssertEqual(duplicates, [])
    }

    func testParse() throws {
        let swiftTrendingPage = TestResources.trendingPage(of: .language(name: "swift"))
        let repositories = try parser.repositories(fromTrendingPage: swiftTrendingPage)
        XCTAssertEqual(repositories.count, 25)
        let repository = try XCTUnwrap(repositories.first)
        XCTAssertEqual(repository.pageLink.repositoryName, "lottie-ios")
        XCTAssertEqual(repository.pageLink.href, "/airbnb/lottie-ios")
        XCTAssertEqual(repository.summary, "An iOS library to natively render After Effects vector animations")
    }

    func testParseDevelopers() throws {
        let html = TestResources.trendingDevelopersPage()
        let developers = try parser.developers(fromTrendingPage: html)
        XCTAssertEqual(developers.count, 25)

        let first = try XCTUnwrap(developers.first)
        XCTAssertEqual(first.username, "Astro-Han")
        XCTAssertEqual(first.displayName, "AstroHan")
        XCTAssertEqual(first.avatarURL?.absoluteString, "https://avatars.githubusercontent.com/u/255364436?s=96&v=4")
        XCTAssertEqual(first.popularRepository?.name, "karpathy-llm-wiki")
        XCTAssertEqual(first.popularRepository?.href, "/Astro-Han/karpathy-llm-wiki")
        XCTAssertTrue(first.popularRepository?.summary?.contains("Agent Skills-compatible LLM wiki") == true)
    }
}

extension Array where Element: Hashable {
    func findDuplicates() -> [Element] {
        var counts: [Element: Int] = [:]
        
        for element in self {
            counts[element, default: 0] += 1
        }
        
        return counts
            .filter { $0.value > 1 }
            .map(\.key)
    }
}
