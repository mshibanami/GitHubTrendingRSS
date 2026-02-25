// Copyright (c) 2023 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Combine
import Foundation

public class GitHubGraphQLManager {
    public enum Error: Swift.Error {
        case invalidURL
        case noData
        case graphQLError(messages: [String])
    }

    private let downloadManager: DownloadManager
    private let apiToken: String

    public init(downloadManager: DownloadManager, apiToken: String) {
        self.downloadManager = downloadManager
        self.apiToken = apiToken
    }

    /// Fetches Open Graph Image URLs for multiple repositories.
    /// Using GraphQL Aliases to batch multiple repositories in a single request.
    public func fetchRepositoriesOGImages(repositories: [(owner: String, name: String)]) -> AnyPublisher<[String: RepositoryNode], Swift.Error> {
        let endpoint = URL(string: "https://api.github.com/graphql")!
        
        let query = buildBatchQuery(for: repositories)
        
        let requestBody: [String: String] = ["query": query]
        guard let httpBody = try? JSONEncoder().encode(requestBody) else {
            return Fail(error: Error.noData).eraseToAnyPublisher()
        }
        
        return downloadManager
            .fetch(url: endpoint, httpMethod: "POST", httpBody: httpBody, bearerToken: apiToken)
            .tryMap { page in
                guard let data = page.data(using: .utf8) else {
                    throw Error.noData
                }
                
                let response = try JSONDecoder().decode(GraphQLResponse<[String: RepositoryNode?]>.self, from: data)
                
                if let errors = response.errors, !errors.isEmpty {
                    throw Error.graphQLError(messages: errors.map(\.message))
                }
                
                guard let responseData = response.data else {
                    throw Error.noData
                }
                
                return responseData.compactMapValues { $0 }
            }
            .eraseToAnyPublisher()
    }
    
    func buildBatchQuery(for repositories: [(owner: String, name: String)]) -> String {
        var query = "query GetMultipleRepos {\n"
        for (index, repo) in repositories.enumerated() {
            query += """
              repo_\(index): repository(owner: "\(repo.owner)", name: "\(repo.name)") {
                openGraphImageUrl
                usesCustomOpenGraphImage
                id
              }
            
            """
        }
        query += "}"
        return query
    }
}
