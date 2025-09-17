// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Combine
import Darwin
import Foundation
import GitHubTrendingRSSKit
import PathKit
import Stencil

RunCommand().parseAndRun()

enum MainError: Error {
    case noLanguageTrendingLinks
}

let parallelDownloadChunk = 4
nonisolated(unsafe) let downloadManager = DownloadManager()
nonisolated(unsafe) let gitHubPageParser = GitHubPageParser()
nonisolated(unsafe) let gitHubDownloader = GitHubDownloader(
    downloadManager: downloadManager,
    gitHubPageParser: gitHubPageParser,
    clientID: Const.gitHubClientID,
    clientSecret: Const.gitHubClientSecret
)

let environment = Environment(
    loader: FileSystemLoader(paths: [Path(Const.resourcesRootURL.path)]))

let siteInformation = SiteSourceMaker.Information(
    pageTitle: Const.pageTitle,
    author: Const.author,
    rssHomeURL: Const.rssHomeURL.absoluteString,
    googleAnalyticsTrackingCode: Const.googleAnalyticsTrackingCode,
    gitHubRepositoryURL: Const.gitHubRepositoryURL.absoluteString
)

nonisolated(unsafe) let siteGenerator = SiteSourceMaker(
    environment: environment,
    information: siteInformation
)

nonisolated(unsafe) let feedManager = FeedFileCreator(
    outputDirectory: Const.outputDirectory,
    siteGenerator: siteGenerator
)

func start() throws -> AnyPublisher<Void, Error> {
    return Publishers
        .CombineLatest(
            gitHubDownloader.fetchTopTrendingPage(),
            gitHubDownloader.fetchSupportedEmojis()
        )
        .flatMap { topTrendingPage, supportedEmojis -> AnyPublisher<Void, Error> in
            guard let languageLinks = (try? gitHubPageParser.languageTrendingLinks(fromTopTrendingPage: topTrendingPage)) else {
                return Fail(error: MainError.noLanguageTrendingLinks).eraseToAnyPublisher()
            }

            let fetchRepositoriesByPeriod: [[AnyPublisher<Void, Error>]] = Period.allCases.map { period in
                languageLinks.map { link in
                    let fetchRepository = gitHubDownloader
                        .fetchRepositories(
                            ofLink: link,
                            period: period,
                            includesReadMeIfExists: Const.popularLanguages.contains(link.name)
                        )
                        .map { $0 as [Repository]? }
                        .catch { error -> AnyPublisher<[Repository]?, Error> in
                            if let error = error as? DownloadManager.Error,
                               error == .failedFetching(statusCode: 504)
                               || error == .failedFetching(statusCode: 502) {
                                return Result.Publisher(nil).eraseToAnyPublisher()
                            } else {
                                return Fail(error: error).eraseToAnyPublisher()
                            }
                        }
                        .handleEvents(
                            receiveOutput: { repositories in
                                guard let repositories else {
                                    NSLog("⚠️ Failed to fetch repositories of \(link.name).")
                                    return
                                }
                                try! feedManager.createRSSFile(
                                    repositories: repositories,
                                    languageTrendingLink: link,
                                    period: period,
                                    supportedEmojis: supportedEmojis
                                )
                            })
                        .map { _ in () }
                        .eraseToAnyPublisher()
                    return fetchRepository
                }
            }

            let chunked = fetchRepositoriesByPeriod
                .map { fetchRepositories -> [AnyPublisher<Void, Error>] in
                    let chunkedFetchRepositories = fetchRepositories.chunked(into: parallelDownloadChunk)
                    return chunkedFetchRepositories.map {
                        return Publishers.Sequence<[AnyPublisher<Void, Error>], Error>(sequence: $0)
                            .flatMap { $0 }
                            .collect()
                            .handleEvents(receiveCompletion: { _ in
                                _ = try! feedManager.createRSSListFile(languageLinks: languageLinks)
                            })
                            .map { _ in () }
                            .eraseToAnyPublisher()
                    }
                }

            return chunked.reduce(Result.Publisher(()).eraseToAnyPublisher()) { result, publishers in
                return result.flatMap { _ in
                    return publishers.reduce(Result.Publisher(()).eraseToAnyPublisher()) { result, publisher in
                        result.flatMap { publisher }.eraseToAnyPublisher()
                    }.eraseToAnyPublisher()
                }.eraseToAnyPublisher()
            }
        }
        .map { _ in () }
        .eraseToAnyPublisher()
}

let semaphore = DispatchSemaphore(value: 0)

var fetchError: Error?
let cancellable = try start()
    .sink(receiveCompletion: { completion in
        switch completion {
        case let .failure(error):
            fetchError = error
        case .finished:
            break
        }
        semaphore.signal()
    }, receiveValue: {})

semaphore.wait()

if let error = fetchError {
    NSLog("🚨 Fatal Error: \(error)")
    exit(1)
}

NSLog("🎉 Finished fetching & generating feeds successfully")
