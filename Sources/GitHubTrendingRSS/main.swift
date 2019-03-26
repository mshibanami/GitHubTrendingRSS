// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Darwin
import Foundation
import GitHubTrendingRSSKit

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

var numberOfRepositories: Int = 0
for period in Period.allCases {
    for languageLink in languageLinks {
        let semaphore = DispatchSemaphore(value: 0)

        _ = gitHubDownloader.fetchRepositories(ofLink: languageLink, period: period, containsReadMe: Const.populerLanguages.contains(languageLink.name))
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
NSLog("- Number of Repositories: \(numberOfRepositories)")
NSLog("- Saved to \(feedManager.rootOutputDirectory.path)")
