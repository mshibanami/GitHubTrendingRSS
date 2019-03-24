// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import Kanna
import RxSwift

public class GitHubDownloader {    
    let downloadManager: DownloadManager
    let gitHubAPIBaseQueryItems: [URLQueryItem]
    
    private var disposeBag = DisposeBag()

    public init(downloadManager: DownloadManager, clientID: String, clientSecret: String) {
        self.downloadManager = downloadManager
        self.gitHubAPIBaseQueryItems = [
            URLQueryItem(name: "client_id", value: clientID),
            URLQueryItem(name: "client_secret", value: clientSecret)]
    }
    
    public func fetchRepositories(ofLink languageTrendingLink: LanguageTrendingLink, period: Period, containsReadMe: Bool) -> Single<[Repository]> {
        var fetchRepositories: Single<[Repository]> = downloadManager.fetchWebPage(url: languageTrendingLink.url(ofPeriod: period))
            .map { page -> [Repository] in
                guard let parsed = try? HTML(html: page, encoding: .utf8) else {
                    throw RSSError.unsupportedFormat
                }
                
                let repositoryLIList = parsed.css("ol.repo-list > li")
                
                var repositories = [Repository]()
                
                for li in repositoryLIList {
                    guard let titleATag = li.at_css("h3 > a"),
                        let summaryPTag = li.at_css("p") else {
                            continue
                    }
                    
                    guard let summary = summaryPTag.trimmedText,
                        let href = titleATag["href"] else {
                            continue
                    }
                    let repositoryPageLink = RepositoryPageLink(href: href)
                    repositories.append(
                        Repository(pageLink: repositoryPageLink,
                                   summary: summary))
                }
                return repositories
        }
        if containsReadMe {
            fetchRepositories = fetchRepositories.flatMap { [weak self] repositories in
                guard let self = self else {
                    throw RSSError.unknown
                }

                var singles = [Single<Repository>]()
                for repository in repositories {
                    singles.append(
                        self.fetchReadMePage(pageLink: repository.pageLink)
                            .map { readMe in
                                var repo = repository
                                repo.readMe = readMe
                                return repo
                            }
                            .catchError { _ in
                                return Single.just(repository)
                    })
                }
                return Single.zip(singles)
            }
        }
        return fetchRepositories
    }

    public func fetchReadMePage(pageLink: RepositoryPageLink) -> Single<APIReadMe> {
        guard var components = URLComponents(url: pageLink.readMeAPIEndpointURL, resolvingAgainstBaseURL: false) else {
            return .error(DownloadError.invalidURL)
        }
        components.queryItems = gitHubAPIBaseQueryItems
        guard let url = components.url else {
            return .error(DownloadError.invalidURL)
        }
        return downloadManager
            .fetchWebPage(url: url)
            .map { page in
                guard let data = page.data(using: .utf8) else {
                    throw DownloadError.unsupportedFormat
                }
                let decoded = try JSONDecoder().decode(APIReadMe.self, from: data)
                return decoded
        }
    }
    
    public func fetchTopTrendingPage() -> String? {
        return downloadManager.fetchWebPage(url: Const.gitHubTopTrendingURL)
    }
}
