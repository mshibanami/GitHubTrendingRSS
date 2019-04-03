// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit
import XCTest

final class ModelsTests: XCTestCase {
    func testRepository() throws {
        var repository1 = Repository(
            pageLink: RepositoryPageLink(href: "/user/repo"),
            summary: "dummy summary")
        repository1.readMe = APIReadMe()
        let html = repository1.createFeedEntryHTML()
        let repoURL = "https://github.com/user/repo"
        XCTAssertTrue(html.contains("<link>\(repoURL)</link>"))
        XCTAssertEqual(repository1.readMeHTML(), nil)
    }
}
