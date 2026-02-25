import Foundation
@testable import GitHubTrendingRSSKit
import XCTest

public struct MockDownloadManagerError: Error {}

final class GitHubGraphQLManagerTests: XCTestCase {
    func testBuildBatchQuery() {
        let manager = GitHubGraphQLManager(downloadManager: DownloadManager(), apiToken: "dummy")
        let query = manager.buildBatchQuery(for: [
            (owner: "facebook", name: "react"),
            (owner: "vuejs", name: "vue"),
        ])

        let expected = """
        query GetMultipleRepos {
          repo_0: repository(owner: "facebook", name: "react") {
            openGraphImageUrl
            usesCustomOpenGraphImage
            id
          }
          repo_1: repository(owner: "vuejs", name: "vue") {
            openGraphImageUrl
            usesCustomOpenGraphImage
            id
          }
        }
        """
        XCTAssertEqual(query.trimmingCharacters(in: .whitespacesAndNewlines), expected.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}
