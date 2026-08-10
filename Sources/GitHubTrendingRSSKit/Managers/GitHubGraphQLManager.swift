// Copyright (c) 2023 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Algorithms
import Foundation

public actor GitHubGraphQLManager {
    public enum Error: Swift.Error {
        case invalidURL
        case noData
        case graphQLError(messages: [String])
    }

    private let downloadManager: DownloadManager
    private let apiToken: String

    private enum CacheEntry {
        case found(RepositoryNode)
        case missing
    }

    private enum DeveloperCacheEntry {
        case found(DeveloperNode)
        case missing
    }

    private var cache: [String: CacheEntry] = [:]
    private var developerCache: [String: DeveloperCacheEntry] = [:]

    public init(downloadManager: DownloadManager, apiToken: String) {
        self.downloadManager = downloadManager
        self.apiToken = apiToken
    }

    /// Fetches Open Graph Image data for multiple repositories, keyed by
    /// "owner/name". Already-cached repositories are served from the cache and
    /// only the remaining ones are batched into a single GraphQL request using
    /// aliases.
    public func fetchRepositoriesOGImages(repositories: [(owner: String, name: String)]) async throws
    -> [String: RepositoryNode] {
        var result: [String: RepositoryNode] = [:]
        var misses: [(owner: String, name: String)] = []
        for repo in repositories {
            let key = "\(repo.owner)/\(repo.name)"
            switch cache[key] {
            case let .found(node):
                result[key] = node
            case .missing:
                break
            case nil:
                misses.append(repo)
            }
        }

        guard !misses.isEmpty else {
            return result
        }

        let responseData = try await queryOGImages(of: misses)

        for (index, repo) in misses.enumerated() {
            let key = "\(repo.owner)/\(repo.name)"
            if let entry = responseData["repo_\(index)"], let node = entry {
                cache[key] = .found(node)
                result[key] = node
            } else {
                cache[key] = .missing
            }
        }

        return result
    }

    public func fetchDevelopersInfo(usernames: [String]) async throws -> [String: DeveloperNode] {
        let uniqueUsernames = Array(usernames.uniqued())
        var result: [String: DeveloperNode] = [:]
        var misses: [String] = []

        for username in uniqueUsernames {
            switch developerCache[username] {
            case let .found(node):
                result[username] = node
            case .missing:
                break
            case nil:
                misses.append(username)
            }
        }

        guard !misses.isEmpty else {
            return result
        }

        let responseData = try await queryDevelopersInfo(of: misses)

        for (index, username) in misses.enumerated() {
            if let entry = responseData["user_\(index)"], let node = entry {
                developerCache[username] = .found(node)
                result[username] = node
            } else {
                developerCache[username] = .missing
            }
        }

        return result
    }

    private func queryOGImages(of repositories: [(owner: String, name: String)]) async throws
    -> [String: RepositoryNode?] {
        let endpoint = URL(string: "https://api.github.com/graphql")!

        let query = buildBatchQuery(for: repositories)

        let requestBody: [String: String] = ["query": query]
        guard let httpBody = try? JSONEncoder().encode(requestBody) else {
            throw Error.noData
        }

        let page = try await downloadManager.fetch(
            url: endpoint, httpMethod: "POST", httpBody: httpBody, bearerToken: apiToken
        )

        guard let data = page.data(using: .utf8) else {
            throw Error.noData
        }

        let response = try JSONDecoder().decode(
            GraphQLResponse<[String: RepositoryNode?]>.self, from: data
        )

        if let responseData = response.data {
            return responseData
        }

        if let errors = response.errors, !errors.isEmpty {
            throw Error.graphQLError(messages: errors.map(\.message))
        }

        throw Error.noData
    }

    private func queryDevelopersInfo(of usernames: [String]) async throws -> [String: DeveloperNode?] {
        let endpoint = URL(string: "https://api.github.com/graphql")!
        let query = buildBatchUserQuery(usernames: usernames)

        let requestBody: [String: String] = ["query": query]
        guard let httpBody = try? JSONEncoder().encode(requestBody) else {
            throw Error.noData
        }

        let page = try await downloadManager.fetch(
            url: endpoint, httpMethod: "POST", httpBody: httpBody, bearerToken: apiToken
        )

        guard let data = page.data(using: .utf8) else {
            throw Error.noData
        }

        let response = try JSONDecoder().decode(
            GraphQLResponse<[String: DeveloperNode?]>.self, from: data
        )

        if let responseData = response.data {
            return responseData
        }

        if let errors = response.errors, !errors.isEmpty {
            throw Error.graphQLError(messages: errors.map(\.message))
        }

        throw Error.noData
    }

    nonisolated func buildBatchQuery(for repositories: [(owner: String, name: String)]) -> String {
        var query = "query GetMultipleRepos {\n"
        for (index, repo) in repositories.enumerated() {
            query += """
              repo_\(index): repository(owner: "\(repo.owner)", name: "\(repo.name)") {
                openGraphImageUrl
                usesCustomOpenGraphImage
                id
                stargazerCount
              }
            
            """
        }
        query += "}"
        return query
    }

    nonisolated func buildBatchUserQuery(usernames: [String]) -> String {
        var query = "query GetMultipleUsers {\n"
        for (index, username) in usernames.enumerated() {
            let escapedUsername =
                username
                    .replacingOccurrences(of: "\\", with: "\\\\")
                    .replacingOccurrences(of: "\"", with: "\\\"")
                    .replacingOccurrences(of: "\n", with: "")
                    .replacingOccurrences(of: "\r", with: "")
            query += """
              user_\(index): user(login: "\(escapedUsername)") {
                bio
                company
                location
                email
                followers {
                  totalCount
                }
                following {
                  totalCount
                }
                repositories {
                  totalCount
                }
                websiteUrl
                twitterUsername
                socialAccounts(first: 10) {
                  nodes {
                    provider
                    url
                    displayName
                  }
                }
                pinnedItems(first: 6, types: [REPOSITORY]) {
                  nodes {
                    ... on Repository {
                      name
                      url
                      description
                      stargazerCount
                    }
                  }
                }
              }
            
            """
        }
        query += "}"
        return query
    }
}
