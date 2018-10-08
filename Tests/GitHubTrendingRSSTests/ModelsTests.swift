// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit
import XCTest

final class ModelsTests: XCTestCase {

    func testRepository() throws {
        let link = RepositoryPageLink(href: "/user/repo")

        let repository = Repository(
            pageLink: link,
            summary: "dummy summary")

        let html = repository.feedEntryHTML()
        let repoURL = "https://github.com/user/repo"
        XCTAssertTrue(html.contains("<id>\(repoURL)</id>"))
    }

  func testGenerateRssListHTML() throws {
    let links = [LanguageTrendingLink(displayName: "Hello", href: "/hello?since=weekly"),
                 LanguageTrendingLink(displayName: "World", href: "/world?since=weekly") ]

    let generated = links.rssListHTML()
  }
}
