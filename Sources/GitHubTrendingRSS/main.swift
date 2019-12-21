// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Darwin
import Foundation
import GitHubTrendingRSSKit
import RxSwift
import Stencil
import PathKit

RunCommand().parseAndRun()

let parallelDownloadChunk = 3
let downloadManager = DownloadManager()
let gitHubPageParser = GitHubPageParser()
let gitHubDownloader = GitHubDownloader(
    downloadManager: downloadManager,
    gitHubPageParser: gitHubPageParser,
    clientID: Const.gitHubClientID,
    clientSecret: Const.gitHubClientSecret)
let environment = Environment(loader: FileSystemLoader(paths: [Path(Const.resourcesRootURL.path)]))
let siteInformation = SiteGenerator.Information(
    pageTitle: Const.pageTitle,
    author: Const.author,
    rssHomeURL: Const.rssHomeURL.absoluteString,
    googleAnalyticsTrackingCode: Const.googleAnalyticsTrackingCode,
    gitHubRepositoryURL: Const.gitHubRepositoryURL.absoluteString)
let siteGenerator = SiteGenerator(
    environment: environment,
    information: siteInformation)
let feedManager = FeedManager(
    outputDirectory: Const.outputDirectory,
    siteGenerator: siteGenerator)

guard let topTrendingPage = gitHubDownloader.fetchTopTrendingPage() else {
    NSLog("Error: Couldn't fetch \(Const.gitHubTopTrendingURL)")
    exit(1)
}

let languageLinks = try gitHubPageParser
    .languageTrendingLinks(fromTopTrendingPage: topTrendingPage)

for period in Period.allCases {
    let linkChunks = languageLinks.chunked(into: languageLinks.count / parallelDownloadChunk)
    var fetchRepositoriesList: [Single<Void>] = []
    let semaphore = DispatchSemaphore(value: 0)

    for linkChunk in linkChunks {
        var fetchRepositories = Single.just(())
        for link in linkChunk {
            fetchRepositories = fetchRepositories
                .flatMap { _ in
                    gitHubDownloader
                        .fetchRepositories(
                            ofLink: link,
                            period: period,
                            needsReadMe: Const.populerLanguages.contains(link.name))
                }
                .do(onSuccess: { repositories in
                    _ = try! feedManager.saveRSSFile(
                        repositories: repositories,
                        languageTrendingLink: link,
                        period: period)
                })
                .map { _ in () }
        }
        fetchRepositoriesList.append(fetchRepositories)
    }
    _ = Single.zip(fetchRepositoriesList)
        .subscribe({ _ in
            semaphore.signal()
        })
    semaphore.wait()
}

_ = try feedManager.saveRSSListFile(languageLinks: languageLinks)
NSLog("- Saved to \(feedManager.rootOutputDirectory.path)")
