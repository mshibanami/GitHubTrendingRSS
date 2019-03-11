// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit

let downloadManager = DownloadManager()
let gitHubDownloader = GitHubDownloader(downloadManager: downloadManager)
let gitHubPageParser = GitHubPageParser()
let feedManager = FeedManager(outputDirectory: Const.outputDirectory)

guard let topTrendingPage = gitHubDownloader.fetchTopTrendingPage() else {
    print("Error: Couldn't fetch \(Const.gitHubTopTrendingURL)")
    exit(1)
}

let languageLinks = try gitHubPageParser
    .languageTrendingLinks(fromTopTrendingPage: topTrendingPage)

var numberOfRepositories: Int = 0
for period in Period.allCases {
    for languageLink in languageLinks {
        let semaphore = DispatchSemaphore(value: 0)

        _ = gitHubDownloader.fetchRepositories(ofLink: languageLink, period: period)
            .subscribe(onSuccess: { repositories in
                _ = try! feedManager.saveRSSFile(
                    fromRepositories: repositories,
                    languageTrendingLink: languageLink,
                    period: period)
                
                numberOfRepositories += repositories.count
                
                semaphore.signal()
            })
        semaphore.wait()
    }
}

_ = try feedManager.saveRSSListFile(languageLinks: languageLinks)
print("- Number of Repositories: \(numberOfRepositories)")
print("- Saved to \(feedManager.rootOutputDirectory.path)")
