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

    private let readMeCache: AsyncCache<URL, APIReadMe> = AsyncCache()
    private let profileReadMeCache: AsyncCache<URL, APIReadMe?> = AsyncCache()

    public init(
        downloadManager: DownloadManager, gitHubPageParser: GitHubPageParser, githubToken: String
    ) {
        self.downloadManager = downloadManager
        self.gitHubPageParser = gitHubPageParser
        self.githubToken = githubToken
    }

    public func fetchRepositories(
        ofLink languageTrendingLink: LanguageTrendingLink, period: Period,
        spokenLanguage: SpokenLanguage = .unspecified, includesReadMeIfExists: Bool
    ) async throws -> [Repository] {
        let page = try await downloadManager.fetch(
            url: languageTrendingLink.url(ofPeriod: period, spokenLanguage: spokenLanguage),
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

    public func fetchDevelopers(
        ofLink languageTrendingLink: LanguageTrendingLink,
        period: Period,
        includesProfileReadMeIfExists: Bool,
        graphQLManager: GitHubGraphQLManager? = nil
    ) async throws -> [Developer] {
        let page = try await downloadManager.fetch(
            url: languageTrendingLink.developerURL(ofPeriod: period),
            bearerToken: githubToken
        )

        var developers = try gitHubPageParser.developers(fromTrendingPage: page)

        if let graphQLManager {
            let usernames = developers.map(\.username)
            if let userInfos = try? await graphQLManager.fetchDevelopersInfo(usernames: usernames) {
                developers = developers.map { dev -> Developer in
                    var updatedDev = dev
                    if let info = userInfos[dev.username] {
                        updatedDev.bio = info.bio
                        updatedDev.company = info.company
                        updatedDev.location = info.location
                        updatedDev.email = info.email
                        updatedDev.followersCount = info.followers?.totalCount
                        updatedDev.followingCount = info.following?.totalCount
                        updatedDev.publicReposCount = info.repositories?.totalCount
                        updatedDev.websiteURL = info.websiteUrl
                        updatedDev.twitterUsername = info.twitterUsername
                        if let socialNodes = info.socialAccounts?.nodes {
                            updatedDev.socialAccounts = socialNodes.compactMap { node in
                                SocialAccount(
                                    provider: node.provider,
                                    url: node.url,
                                    displayName: node.displayName
                                )
                            }
                        }
                        if let pinnedNodes = info.pinnedItems?.nodes {
                            updatedDev.pinnedRepositories = pinnedNodes.compactMap { node in
                                DeveloperPinnedRepository(
                                    name: node.name,
                                    url: node.url,
                                    summary: node.description,
                                    stargazerCount: node.stargazerCount,
                                    forkCount: node.forkCount
                                )
                            }
                        }
                        if let popularNodes = info.popularRepositories?.nodes {
                            updatedDev.popularRepositories = popularNodes.map { node in
                                DeveloperPopularRepository(
                                    name: node.name,
                                    url: node.url,
                                    summary: node.description,
                                    stargazerCount: node.stargazerCount,
                                    forkCount: node.forkCount
                                )
                            }
                        }
                        if var popularRepository = updatedDev.popularRepository {
                            if let matched = updatedDev.popularRepositories.first(where: {
                                $0.name == popularRepository.name || $0.href == popularRepository.href
                            }) {
                                popularRepository.stargazerCount = matched.stargazerCount
                                popularRepository.forkCount = matched.forkCount
                            } else if let matchedPinned = updatedDev.pinnedRepositories.first(where: {
                                $0.name == popularRepository.name
                                    || $0.url.absoluteString.hasSuffix(popularRepository.href)
                            }) {
                                popularRepository.stargazerCount = matchedPinned.stargazerCount
                                popularRepository.forkCount = matchedPinned.forkCount
                            }
                            updatedDev.popularRepository = popularRepository
                        }
                    }
                    return updatedDev
                }
            }
        }

        guard includesProfileReadMeIfExists else {
            return developers
        }

        return await withTaskGroup(of: (Int, Developer).self) { group in
            for (index, developer) in developers.enumerated() {
                group.addTask {
                    var dev = developer
                    do {
                        dev.profileReadMe = try await self.fetchProfileReadMePage(username: developer.username)
                    } catch {
                        // ignore
                    }
                    return (index, dev)
                }
            }

            var results = [(Int, Developer)]()
            for await result in group {
                results.append(result)
            }
            return results.sorted { $0.0 < $1.0 }.map { $1 }
        }
    }

    public func fetchProfileReadMePage(username: String) async throws -> APIReadMe? {
        guard let url = URL(string: "https://api.github.com/repos/\(username)/\(username)/readme") else {
            return nil
        }
        return try await profileReadMeCache.value(for: url) {
            do {
                let page = try await self.downloadManager.fetch(url: url, bearerToken: self.githubToken)
                guard let data = page.data(using: .utf8) else {
                    return nil
                }
                var decoded = try JSONDecoder().decode(APIReadMe.self, from: data)
                decoded.userID = username
                decoded.repositoryName = username
                return decoded
            } catch let DownloadManager.Error.failedFetching(statusCode) where statusCode == 404 {
                return nil
            } catch {
                return nil
            }
        }
    }

    public func fetchReadMePage(pageLink: RepositoryPageLink) async throws -> APIReadMe {
        guard
            let components = URLComponents(
                url: pageLink.readMeAPIEndpointURL, resolvingAgainstBaseURL: false
            ) else {
            throw DownloadManager.Error.invalidURL
        }
        guard let url = components.url else {
            throw DownloadManager.Error.invalidURL
        }
        let userID = pageLink.userID
        let repositoryName = pageLink.repositoryName
        return try await readMeCache.value(for: url) {
            let page = try await self.downloadManager.fetch(url: url, bearerToken: self.githubToken)
            guard let data = page.data(using: .utf8) else {
                throw Error.unsupportedFormat
            }
            var decoded = try JSONDecoder().decode(APIReadMe.self, from: data)
            decoded.userID = userID
            decoded.repositoryName = repositoryName
            return decoded
        }
    }

    public func fetchTopTrendingPage() async throws -> String {
        return try await downloadManager.fetch(url: Const.gitHubTopTrendingURL)
    }

    public func fetchSupportedEmojis() async throws -> [GitHubEmoji] {
        let body = try await downloadManager.fetch(
            url: Const.gitHubAPIEmojisURL, bearerToken: githubToken
        )
        guard let data = body.data(using: .utf8) else {
            throw Error.unsupportedFormat
        }
        let emojiList = try JSONDecoder().decode(APIEmojiList.self, from: data)
        return emojiList.makeEmojis()
    }
}
