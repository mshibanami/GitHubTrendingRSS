import Foundation
import XCTest
@testable import GitHubTrendingRSSKit

final class DownloadManagerTests: XCTestCase {
    func testFetchAsync() async throws {
        let manager = DownloadManager()
        let result = try await manager.fetch(url: XCTUnwrap(URL(string: "https://example.com")))
        XCTAssertTrue(result.contains("Example Domain"))
    }
}
