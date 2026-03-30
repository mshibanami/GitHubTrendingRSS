// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import SwiftSoup

public final class GitHubDownloader: Sendable {
    public enum Error: Swift.Error {
        case unsupportedFormat
        case invalidURL
    }

    let downloadManager: DownloadManager
    let gitHubPageParser: GitHubPageParser
    private let githubToken: String

    public init(downloadManager: DownloadManager, gitHubPageParser: GitHubPageParser, githubToken: String) {
        self.downloadManager = downloadManager
        self.gitHubPageParser = gitHubPageParser
        self.githubToken = githubToken
    }

    public func fetchRepositories(ofLink languageTrendingLink: LanguageTrendingLink, period: Period, includesReadMeIfExists: Bool) async throws -> [Repository] {
        let page = try await downloadManager.fetch(
            url: languageTrendingLink.url(ofPeriod: period),
            bearerToken: githubToken
        )
        
        let repositories = try gitHubPageParser.repositories(fromTrendingPage: page)

        guard includesReadMeIfExists else {
            return repositories
        }

        return await withTaskGroup(of: (Int, Repository).self) { group in
            for (index, repository) in repositories.enumerated() {
                group.addTask {
                    var repo = repository
                    do {
                        repo.readMe = try await self.fetchReadMePage(pageLink: repository.pageLink)
                    } catch {
                        // ignore
                    }
                    return (index, repo)
                }
            }
            
            var results = [(Int, Repository)]()
            for await result in group {
                results.append(result)
            }
            return results.sorted { $0.0 < $1.0 }.map { $1 }
        }
    }

    public func fetchReadMePage(pageLink: RepositoryPageLink) async throws -> APIReadMe {
        guard let components = URLComponents(url: pageLink.readMeAPIEndpointURL, resolvingAgainstBaseURL: false) else {
            throw DownloadManager.Error.invalidURL
        }
        guard let url = components.url else {
            throw DownloadManager.Error.invalidURL
        }
        let page = try await downloadManager.fetch(url: url, bearerToken: githubToken)
        guard let data = page.data(using: .utf8) else {
            throw Error.unsupportedFormat
        }
        var decoded = try JSONDecoder().decode(APIReadMe.self, from: data)
        decoded.userID = pageLink.userID
        decoded.repositoryName = pageLink.repositoryName
        return decoded
    }

    public func fetchTopTrendingPage() async throws -> String {
        return try await downloadManager.fetch(url: Const.gitHubTopTrendingURL)
    }

    public func fetchSupportedEmojis() async throws -> [GitHubEmoji] {
        let body = try await downloadManager.fetch(url: Const.gitHubAPIEmojisURL, bearerToken: githubToken)
        guard let data = body.data(using: .utf8) else {
            throw Error.unsupportedFormat
        }
        let emojiList = try JSONDecoder().decode(APIEmojiList.self, from: data)
        return emojiList.makeEmojis()
    }
}
