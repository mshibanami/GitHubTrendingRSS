// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import XCTest
@testable import GitHubTrendingRSSKit

final class FetchTargetTests: XCTestCase {
    func testInitialization() {
        XCTAssertEqual(FetchTarget(rawValue: "all"), .all)
        XCTAssertEqual(FetchTarget(rawValue: "repos"), .repos)
        XCTAssertEqual(FetchTarget(rawValue: "REPOS"), .repos)
        XCTAssertEqual(FetchTarget(rawValue: "repositories"), .repos)
        XCTAssertEqual(FetchTarget(rawValue: "developers"), .developers)
        XCTAssertEqual(FetchTarget(rawValue: "devs"), .developers)
        XCTAssertEqual(FetchTarget(rawValue: "DEVS"), .developers)
        XCTAssertEqual(FetchTarget(rawValue: "unknown_value"), .all)
    }

    func testShouldFetchFlags() {
        XCTAssertTrue(FetchTarget.all.shouldFetchRepos)
        XCTAssertTrue(FetchTarget.all.shouldFetchDevelopers)

        XCTAssertTrue(FetchTarget.repos.shouldFetchRepos)
        XCTAssertFalse(FetchTarget.repos.shouldFetchDevelopers)

        XCTAssertFalse(FetchTarget.developers.shouldFetchRepos)
        XCTAssertTrue(FetchTarget.developers.shouldFetchDevelopers)
    }
}
