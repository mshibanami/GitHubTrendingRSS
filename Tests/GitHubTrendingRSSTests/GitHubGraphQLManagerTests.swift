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

    func testBuildBatchUserQuery() {
        let manager = GitHubGraphQLManager(downloadManager: DownloadManager(), apiToken: "dummy")
        let query = manager.buildBatchUserQuery(usernames: ["Astro-Han", "lalalune"])
        XCTAssertTrue(query.contains("user_0: user(login: \"Astro-Han\")"))
        XCTAssertTrue(query.contains("user_1: user(login: \"lalalune\")"))
        XCTAssertTrue(query.contains("pinnedItems(first: 6, types: [REPOSITORY])"))
    }

    func testDecodeDeveloperNode() throws {
        let json = """
        {
            "bio": "Building stuff",
            "company": "Acme Inc.",
            "location": "Tokyo",
            "followers": { "totalCount": 100 },
            "repositories": { "totalCount": 20 },
            "websiteUrl": "https://example.com",
            "twitterUsername": "acme_dev",
            "pinnedItems": {
                "nodes": [
                    {
                        "name": "cool-project",
                        "url": "https://github.com/acme/cool-project",
                        "description": "A very cool project",
                        "stargazerCount": 50
                    }
                ]
            }
        }
        """.data(using: .utf8)!

        let node = try JSONDecoder().decode(DeveloperNode.self, from: json)
        XCTAssertEqual(node.bio, "Building stuff")
        XCTAssertEqual(node.company, "Acme Inc.")
        XCTAssertEqual(node.location, "Tokyo")
        XCTAssertEqual(node.followers?.totalCount, 100)
        XCTAssertEqual(node.repositories?.totalCount, 20)
        XCTAssertEqual(node.websiteUrl?.absoluteString, "https://example.com")
        XCTAssertEqual(node.twitterUsername, "acme_dev")
        XCTAssertEqual(node.pinnedItems?.nodes?.count, 1)
        XCTAssertEqual(node.pinnedItems?.nodes?.first?.name, "cool-project")
        XCTAssertEqual(node.pinnedItems?.nodes?.first?.stargazerCount, 50)
    }

    func testDecodeGraphQLPartialResponseWithErrors() throws {
        let json = """
        {
            "data": {
                "user_0": {
                    "bio": "Valid user",
                    "company": "Valid Corp"
                },
                "user_1": null
            },
            "errors": [
                {
                    "message": "Could not resolve to a User with the login of 'invalid-user'.",
                    "type": "NOT_FOUND"
                }
            ]
        }
        """.data(using: .utf8)!

        let response = try JSONDecoder().decode(GraphQLResponse<[String: DeveloperNode?]>.self, from: json)
        XCTAssertNotNil(response.data)
        XCTAssertEqual(response.errors?.count, 1)

        let data = try XCTUnwrap(response.data)
        let user0 = try XCTUnwrap(data["user_0"] ?? nil)
        XCTAssertEqual(user0.bio, "Valid user")
        XCTAssertNil(data["user_1"] ?? nil)
    }
}
