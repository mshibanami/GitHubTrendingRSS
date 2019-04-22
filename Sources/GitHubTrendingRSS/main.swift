// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Darwin
import Foundation
import GitHubTrendingRSSKit
import RxSwift

let parallelDownloadingChunk = 3

func checkCommandLineArguments() {
    guard CommandLine.arguments.count == 3,
        !CommandLine.arguments[1].isEmpty,
        !CommandLine.arguments[2].isEmpty else {
            fputs(
                """
        Error: The arguments are incorrect.
        Please specify like this:
            swift run GitHubTrendingRSS <GitHub Client ID> <GitHub Client Secret>\n
        """, stderr)
            exit(1)
    }
}
checkCommandLineArguments()

let downloadManager = DownloadManager()
let gitHubDownloader = GitHubDownloader(
    downloadManager: downloadManager,
    clientID: Const.gitHubClientID,
    clientSecret: Const.gitHubClientSecret)
let gitHubPageParser = GitHubPageParser()
let feedManager = FeedManager(outputDirectory: Const.outputDirectory)

guard let topTrendingPage = gitHubDownloader.fetchTopTrendingPage() else {
    NSLog("Error: Couldn't fetch \(Const.gitHubTopTrendingURL)")
    exit(1)
}

let languageLinks = try gitHubPageParser
    .languageTrendingLinks(fromTopTrendingPage: topTrendingPage)

for period in Period.allCases {
    let linkChunks = languageLinks.chunked(into: languageLinks.count / parallelDownloadingChunk)
    for linkChunk in linkChunks {
        let semaphore = DispatchSemaphore(value: 0)
        var fetchRepositories = [Single<[Repository]>]()

        for link in linkChunk {
            fetchRepositories.append(
                gitHubDownloader
                    .fetchRepositories(
                        ofLink: link,
                        period: period,
                        containsReadMe: Const.populerLanguages.contains(link.name))
                    .do(onSuccess: { repositories in
                        _ = try! feedManager.saveRSSFile(
                            fromRepositories: repositories,
                            languageTrendingLink: link,
                            period: period)
                    })
            )
        }
        _ = Single.zip(fetchRepositories)
            .subscribe { _ in
                semaphore.signal()
        }
        semaphore.wait()
    }
}

_ = try feedManager.saveRSSListFile(languageLinks: languageLinks)
NSLog("- Saved to \(feedManager.rootOutputDirectory.path)")
