// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import GitHubTrendingRSSKit
import PathKit
import Stencil
import XCTest

final class FeedFileCreatorTests: XCTestCase {
    private let environment = Environment(loader: FileSystemLoader(paths: [Path(Const.resourcesRootURL.path)]))
    private let information = SiteSourceMaker.Information(
        pageTitle: "page title",
        author: "spring water",
        rssHomeURL: "rss home url",
        googleAnalyticsTrackingCode: "141421356",
        gitHubRepositoryURL: "github repository url"
    )
    private var tempDir: URL!

    override func setUp() async throws {
        try await super.setUp()
        try await DocslothManager.shared.setup()
        tempDir = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    }

    override func tearDown() async throws {
        try? FileManager.default.removeItem(at: tempDir)
        try await super.tearDown()
    }

    func testCreateRSSFilePaths() async throws {
        let maker = SiteSourceMaker(environment: environment, information: information)
        let creator = FeedFileCreator(outputDirectory: tempDir, siteGenerator: maker)
        let link = LanguageTrendingLink(displayName: "All Languages", href: Const.gitHubTopTrendingURL.path)

        let urlUnspecified = try await creator.createRSSFile(
            repositories: [],
            languageTrendingLink: link,
            period: .daily,
            spokenLanguage: .unspecified,
            supportedEmojis: []
        )
        XCTAssertEqual(urlUnspecified.path, tempDir.appendingPathComponent("daily/all.xml").path)
        XCTAssertTrue(FileManager.default.fileExists(atPath: urlUnspecified.path))

        let urlEn = try await creator.createRSSFile(
            repositories: [],
            languageTrendingLink: link,
            period: .daily,
            spokenLanguage: .en,
            supportedEmojis: []
        )
        XCTAssertEqual(urlEn.path, tempDir.appendingPathComponent("en/daily/all.xml").path)
        XCTAssertTrue(FileManager.default.fileExists(atPath: urlEn.path))
    }
}
