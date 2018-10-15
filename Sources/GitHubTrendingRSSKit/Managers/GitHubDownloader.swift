// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import Kanna

public class GitHubDownloader {

    let downloadManager: DownloadManager

    public init(downloadManager: DownloadManager) {
        self.downloadManager = downloadManager
    }

    public func fetchRepositories(ofLink languageTrendingLink: LanguageTrendingLink, period: Period, completion: @escaping ([Repository]?, Error?) -> Void) {
        downloadManager.fetchWebPage(url: languageTrendingLink.url(ofPeriod: period)) { page, error in
            guard let page = page else {
                completion(nil, error)
                return
            }

            guard let parsed = try? HTML(html: page, encoding: .utf8) else {
                fatalError()
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
                let repoPageLink = RepositoryPageLink(href: href)

                repositories.append(
                    Repository(pageLink: repoPageLink,
                               summary: summary))
            }
            completion(repositories, nil)
        }
    }

    public func fetchTopTrendingPage() -> String? {
        return downloadManager.fetchWebPage(url: Const.gitHubTopTrendingURL)
    }
}
