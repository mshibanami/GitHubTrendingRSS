// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit

let downloadManager = DownloadManager()
let gitHubDownloader = GitHubDownloader(downloadManager: downloadManager)
let gitHubPageParser = GitHubPageParser()
let feedManager = FeedManager(outputDirectory: Const.outputDirectory)

guard let topTrendingPage = gitHubDownloader.fetchTopTrendingPage() else {
    print("Error: Couldn't fetch \(Const.topTrendingURL)")
    exit(1)
}

let languageLinks = try gitHubPageParser
    .languageTrendingLinks(fromTrendingPage: topTrendingPage)

for period in Period.allCases {
    for languageLink in languageLinks {
        let semaphore = DispatchSemaphore(value: 0)

        gitHubDownloader.fetchRepositories(ofLink: languageLink, period: period) { repositories, _ in
            guard let repositories = repositories else {
                semaphore.signal()
                return
            }

            _ = try! feedManager.saveRSSFile(
                fromRepositories: repositories,
                languageTrendingLink: languageLink,
                period: period)

            semaphore.signal()
        }
        semaphore.wait()
    }
}

_ = try feedManager.saveRSSListFile(languageLinks: languageLinks)

print("Saved to: \(feedManager.rootOutputDirectory.absoluteString)")
