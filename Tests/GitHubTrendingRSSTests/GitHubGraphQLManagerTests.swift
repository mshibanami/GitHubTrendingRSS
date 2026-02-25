import Foundation
import XCTest
@testable import GitHubTrendingRSSKit

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

  func testDecodeBatchQueryResponse() throws {
    let data = TestResources.getData(ofFileName: "api.github.com_graphql_batch_response.json")
    let response = try JSONDecoder().decode(GraphQLResponse<[String: RepositoryNode?]>.self, from: data)
    XCTAssertNil(response.errors)

    let repos = try XCTUnwrap(response.data)
    XCTAssertEqual(repos.count, 2)

    let repo0Optional = try XCTUnwrap(repos["repo_0"])
    let repo0 = try XCTUnwrap(repo0Optional)
    XCTAssertEqual(repo0.openGraphImageUrl.absoluteString, "https://opengraph.githubassets.com/dbdb7c9a03dabaa2e52463f68846ac5ea6830d3f326e266518b92f9bc0237e8b/swiftlang/swift")
    XCTAssertFalse(repo0.usesCustomOpenGraphImage)

    let repo1Optional = try XCTUnwrap(repos["repo_1"])
    let repo1 = try XCTUnwrap(repo1Optional)
    XCTAssertEqual(repo1.openGraphImageUrl.absoluteString, "https://opengraph.githubassets.com/4a95d64df8f4beb813af3dca2b07b851592c6a28adc4075e03a4d73a1167561c/microsoft/vscode")
    XCTAssertFalse(repo1.usesCustomOpenGraphImage)
  }
}
