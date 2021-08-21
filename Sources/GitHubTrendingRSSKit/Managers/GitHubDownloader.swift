// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Combine
import Foundation
import SwiftSoup

public class GitHubDownloader {
    enum Error: Swift.Error {
        case noSelf
        case unsupportedFormat
        case invalidURL
    }

    let downloadManager: DownloadManager
    let gitHubPageParser: GitHubPageParser
    private let basicAuthInfo: BasicAuthInfo

    public init(downloadManager: DownloadManager, gitHubPageParser: GitHubPageParser, clientID: String, clientSecret: String) {
        self.downloadManager = downloadManager
        self.gitHubPageParser = gitHubPageParser
        basicAuthInfo = BasicAuthInfo(
            userName: Const.gitHubClientID,
            password: Const.gitHubClientSecret)
    }

    public func fetchRepositories(ofLink languageTrendingLink: LanguageTrendingLink, period: Period, includesReadMeIfExists: Bool) -> AnyPublisher<[Repository], Swift.Error> {
        let fetchRepositories = downloadManager
            .fetch(
                url: languageTrendingLink.url(ofPeriod: period),
                basicAuthInfo: basicAuthInfo)
            .tryMap({ [weak self] page -> [Repository] in
                guard let self = self else {
                    throw Error.noSelf
                }
                return try self.gitHubPageParser.repositories(fromTrendingPage: page)
            })
            .eraseToAnyPublisher()

        guard includesReadMeIfExists else {
            return fetchRepositories
        }

        return fetchRepositories
            .flatMap({ [weak self] repositories -> AnyPublisher<[Repository], Swift.Error> in
                guard let self = self else {
                    return Result.Publisher([]).eraseToAnyPublisher()
                }

                var singles = [AnyPublisher<Repository, Never>]()
                for repository in repositories {
                    singles.append(
                        self.fetchReadMePage(pageLink: repository.pageLink)
                            .map({
                                var repo = repository
                                repo.readMe = $0
                                return repo
                            })
                            .replaceError(with: repository)
                            .eraseToAnyPublisher()
                    )
                }
                return Publishers.Sequence<[AnyPublisher<Repository, Never>], Never>(sequence: singles)
                    .flatMap { $0 }
                    .collect()
                    .setFailureType(to: Swift.Error.self)
                    .eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }

    public func fetchReadMePage(pageLink: RepositoryPageLink) -> AnyPublisher<APIReadMe, Swift.Error> {
        guard let components = URLComponents(url: pageLink.readMeAPIEndpointURL, resolvingAgainstBaseURL: false) else {
            return Fail(error: DownloadManager.Error.invalidURL).eraseToAnyPublisher()
        }
        guard let url = components.url else {
            return Fail(error: DownloadManager.Error.invalidURL).eraseToAnyPublisher()
        }
        return downloadManager
            .fetch(url: url, basicAuthInfo: basicAuthInfo)
            .tryMap({ page in
                guard let data = page.data(using: .utf8) else {
                    throw Error.unsupportedFormat
                }
                var decoded = try JSONDecoder().decode(APIReadMe.self, from: data)
                decoded.userID = pageLink.userID
                decoded.repositoryName = pageLink.repositoryName
                return decoded
            })
            .eraseToAnyPublisher()
    }

    public func fetchTopTrendingPage() -> AnyPublisher<String, Swift.Error> {
        return downloadManager.fetch(url: Const.gitHubTopTrendingURL)
    }
    
    public func fetchSupportedEmojis() -> AnyPublisher<[GitHubEmoji], Swift.Error> {
        return downloadManager
            .fetch(url: Const.gitHubAPIEmojisURL)
            .tryMap { body -> [GitHubEmoji] in
                guard let data = body.data(using: .utf8) else {
                    throw Error.unsupportedFormat
                }
                let emojiList = try JSONDecoder().decode(APIEmojiList.self, from: data)
                return emojiList.makeEmojis()
            }
            .eraseToAnyPublisher()
    }
}
