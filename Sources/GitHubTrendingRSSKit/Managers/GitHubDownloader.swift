// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import Kanna
import RxSwift

public class GitHubDownloader {

    let downloadManager: DownloadManager
    
    private var disposeBag = DisposeBag()

    public init(downloadManager: DownloadManager) {
        self.downloadManager = downloadManager
    }
    
    public func fetchRepositories(ofLink languageTrendingLink: LanguageTrendingLink, period: Period) -> Single<[Repository]> {
        return downloadManager.fetchWebPage(url: languageTrendingLink.url(ofPeriod: period))
            .map{ page -> [Repository] in
                print("    start parse a repositories page")
                guard let parsed = try? HTML(html: page, encoding: .utf8) else {
                    throw RSSError.unsupportedFormat
                }
                print("    end parse")
                
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
            .flatMap { [weak self] repositories in
                guard let self = self else {
                    throw RSSError.unknown
                }
                var single = Single<[Repository]>.just([])
                for repository in repositories {
                    single = single.flatMap { repos in
                        return self.fetchReadMePage(pageLink: repository.pageLink)
                            .map { page in
                                var repo = repository
                                repo.readMeText = page
                                return repos + [repo]
                        }
                    }
                }
                return single
            }
    }

    public func fetchReadMePage(pageLink: RepositoryPageLink) -> Single<String> {
        return .just("")
    }
    
    public func fetchTopTrendingPage() -> String? {
        return downloadManager.fetchWebPage(url: Const.gitHubTopTrendingURL)
    }
}
