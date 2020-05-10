// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import SwiftSoup
import Combine

public class GitHubDownloader {
    let downloadManager: DownloadManager
    let gitHubPageParser: GitHubPageParser
    let gitHubAPIBaseQueryItems: [URLQueryItem]

    public init(downloadManager: DownloadManager, gitHubPageParser: GitHubPageParser, clientID: String, clientSecret: String) {
        self.downloadManager = downloadManager
        self.gitHubPageParser = gitHubPageParser
        self.gitHubAPIBaseQueryItems = [
            URLQueryItem(name: "client_id", value: clientID),
            URLQueryItem(name: "client_secret", value: clientSecret)]
    }

    public func fetchRepositories(ofLink languageTrendingLink: LanguageTrendingLink, period: Period, needsReadMe: Bool) -> AnyPublisher<[Repository], Error> {
        let fetchRepositories = downloadManager
            .fetchWebPage(url: languageTrendingLink.url(ofPeriod: period))
            .tryMap({ [weak self] page -> [Repository] in
                guard let self = self else {
                    throw RSSError.unknown
                }
                return try self.gitHubPageParser.repositories(fromTrendingPage: page)
            })
            .eraseToAnyPublisher()
        
        guard needsReadMe else {
            return fetchRepositories
        }
        
        return fetchRepositories
            .flatMap({ [weak self] repositories -> AnyPublisher<[Repository], Error> in
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
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }
    
    public func fetchReadMePage(pageLink: RepositoryPageLink) -> AnyPublisher<APIReadMe, Error> {
        guard var components = URLComponents(url: pageLink.readMeAPIEndpointURL, resolvingAgainstBaseURL: false) else {
            return Fail(error: DownloadError.invalidURL).eraseToAnyPublisher()
        }
        components.queryItems = gitHubAPIBaseQueryItems
        guard let url = components.url else {
            return Fail(error: DownloadError.invalidURL).eraseToAnyPublisher()
        }
        return downloadManager
            .fetchWebPage(url: url)
            .tryMap({ page in
                guard let data = page.data(using: .utf8) else {
                    throw DownloadError.unsupportedFormat
                }
                var decoded = try JSONDecoder().decode(APIReadMe.self, from: data)
                decoded.userID = pageLink.userID
                decoded.repositoryName = pageLink.repositoryName
                return decoded
            })
            .eraseToAnyPublisher()
    }

    public func fetchTopTrendingPage() -> AnyPublisher<String, Error> {
        return downloadManager.fetchWebPage(url: Const.gitHubTopTrendingURL)
    }
}
