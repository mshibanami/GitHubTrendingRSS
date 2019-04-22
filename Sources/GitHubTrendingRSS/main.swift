// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Basic
import Darwin
import Foundation
import GitHubTrendingRSSKit
import RxSwift
import Utility

let parallelDownloadingChunk = 3

func setup() {
    let arguments = Array(ProcessInfo.processInfo.arguments.dropFirst())
    let parser = ArgumentParser(usage: "<options>", overview: "RSS feeds generator for GitHub Trending")

    let clientIDArgument = parser.add(option: "--client-id", kind: String.self, usage: "Your GitHub's client ID")
    let clientSecretArgument = parser.add(option: "--client-secret", kind: String.self, usage: "Your GitHub's client secret")
    // Dummy args already used by SwiftPM
    _ = parser.add(option: "--configuration", shortName: "-c", kind: String.self, usage: "-")

    let parsed = try! parser.parse(arguments)

    guard let clientID = parsed.get(clientIDArgument), let clientSecret = parsed.get(clientSecretArgument) else {
        fputs("Error: Please specify the GitHub client ID and secret. \n\n", stderr)
        parser.printUsage(on: stdoutStream)
        exit(1)
    }
    Const.setup(gitHubClientID: clientID, gitHubClientSecret: clientSecret)
}
setup()

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
