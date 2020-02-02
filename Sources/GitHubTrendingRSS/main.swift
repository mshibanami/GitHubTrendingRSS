// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Darwin
import Foundation
import GitHubTrendingRSSKit
import Combine
import Stencil
import PathKit

RunCommand().parseAndRun()

let parallelDownloadChunk = 4
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
    var fetchRepositoriesList: [AnyPublisher<Void, Error>] = []
    let semaphore = DispatchSemaphore(value: 0)
    
    for linkChunk in linkChunks {
        var fetchRepositories: AnyPublisher<Void, Error>
            = Swift.Result<Void, Error>.Publisher(()).eraseToAnyPublisher()
        for link in linkChunk {
            fetchRepositories = fetchRepositories
                .flatMap({ _ in
                    gitHubDownloader
                        .fetchRepositories(
                            ofLink: link,
                            period: period,
                            needsReadMe: Const.populerLanguages.contains(link.name))
                })
                .handleEvents(receiveOutput: { repositories in
                    _ = try! feedManager.saveRSSFile(
                        repositories: repositories,
                        languageTrendingLink: link,
                        period: period)
                })
                .map { _ in () }
                .eraseToAnyPublisher()
        }
        fetchRepositoriesList.append(fetchRepositories)
    }
    let subscriber = Publishers.Sequence<[AnyPublisher<Void, Error>], Error>(sequence: fetchRepositoriesList)
        .flatMap { $0 }
        .collect()
        .sink(receiveCompletion: { _ in
            semaphore.signal()
        }, receiveValue: { _ in })
    
    semaphore.wait()
    subscriber.cancel()
}

_ = try feedManager.saveRSSListFile(languageLinks: languageLinks)
NSLog("- Saved to \(feedManager.rootOutputDirectory.path)")
