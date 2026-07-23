// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Darwin
import Foundation
import GitHubTrendingRSSKit
import PathKit
import Stencil

RunCommand().parseAndRun()

enum MainError: Error {
    case noLanguageTrendingLinks
}

struct FeedTarget: Sendable {
    let spokenLanguage: SpokenLanguage
    let period: Period
    let link: LanguageTrendingLink
}

let maxConcurrentLanguageGenerations = 16
let gitHubHost = Const.gitHubBaseURL.host ?? "github.com"
let downloadManager = DownloadManager(
    maxConcurrentRequestsByHost: [gitHubHost: 2],
    minRequestIntervalByHost: [gitHubHost: 0.75]
)
let gitHubPageParser = GitHubPageParser()
let gitHubDownloader = GitHubDownloader(
    downloadManager: downloadManager,
    gitHubPageParser: gitHubPageParser,
    githubToken: Const.githubToken
)
let graphQLManager = GitHubGraphQLManager(
    downloadManager: downloadManager,
    apiToken: Const.githubToken
)

let environment = Environment(
    loader: FileSystemLoader(paths: [Path(Const.resourcesRootURL.path)])
)

let siteInformation = SiteSourceMaker.Information(
    pageTitle: Const.pageTitle,
    author: Const.author,
    rssHomeURL: Const.rssHomeURL.absoluteString,
    googleAnalyticsTrackingCode: Const.googleAnalyticsTrackingCode,
    gitHubRepositoryURL: Const.gitHubRepositoryURL.absoluteString
)

let siteGenerator = SiteSourceMaker(
    environment: environment,
    information: siteInformation
)

let feedManager = FeedFileCreator(
    outputDirectory: Const.outputDirectory,
    siteGenerator: siteGenerator
)

func start() async throws {
    try await DocslothManager.shared.setup()
    async let topTrendingPageTask = gitHubDownloader.fetchTopTrendingPage()
    async let supportedEmojisTask = gitHubDownloader.fetchSupportedEmojis()

    let (topTrendingPage, supportedEmojis) = try await (topTrendingPageTask, supportedEmojisTask)

    let languageLinks = try gitHubPageParser.languageTrendingLinks(fromTopTrendingPage: topTrendingPage)
    guard !languageLinks.isEmpty else {
        throw MainError.noLanguageTrendingLinks
    }

    try await languageLinks.forEachConcurrent(maxConcurrency: maxConcurrentLanguageGenerations) { link in
        await processLanguage(
            link: link,
            supportedEmojis: supportedEmojis,
            gitHubDownloader: gitHubDownloader,
            graphQLManager: graphQLManager,
            feedManager: feedManager
        )
    }

    _ = try? feedManager.createRSSListFile(languageLinks: languageLinks)
}

private func processLanguage(
    link: LanguageTrendingLink,
    supportedEmojis: [GitHubEmoji],
    gitHubDownloader: GitHubDownloader,
    graphQLManager: GitHubGraphQLManager,
    feedManager: FeedFileCreator
) async {
    let periodsLongestFirst: [Period] = [.monthly, .weekly, .daily]
    let filteredSpokenLanguages = SpokenLanguage.allCases.filter { $0 != .unspecified }
    var skipRemainingPeriods = false

    for period in periodsLongestFirst {
        if skipRemainingPeriods {
            await writeEmptyFeeds(
                link: link,
                period: period,
                spokenLanguages: SpokenLanguage.allCases,
                supportedEmojis: supportedEmojis,
                feedManager: feedManager
            )
            continue
        }

        let outcome = await processFeed(
            target: FeedTarget(spokenLanguage: .unspecified, period: period, link: link),
            supportedEmojis: supportedEmojis,
            gitHubDownloader: gitHubDownloader,
            graphQLManager: graphQLManager,
            feedManager: feedManager
        )

        if case .fetched(isEmpty: true) = outcome {
            NSLog("⏭ \(link.name): no trending repositories (\(period.rawValue)); skipping variant fetches")
            await writeEmptyFeeds(
                link: link,
                period: period,
                spokenLanguages: filteredSpokenLanguages,
                supportedEmojis: supportedEmojis,
                feedManager: feedManager
            )
            skipRemainingPeriods = true
        } else {
            for spokenLanguage in filteredSpokenLanguages {
                await processFeed(
                    target: FeedTarget(spokenLanguage: spokenLanguage, period: period, link: link),
                    supportedEmojis: supportedEmojis,
                    gitHubDownloader: gitHubDownloader,
                    graphQLManager: graphQLManager,
                    feedManager: feedManager
                )
            }
        }
    }
}

private func writeEmptyFeeds(
    link: LanguageTrendingLink,
    period: Period,
    spokenLanguages: [SpokenLanguage],
    supportedEmojis: [GitHubEmoji],
    feedManager: FeedFileCreator
) async {
    for spokenLanguage in spokenLanguages {
        do {
            try await feedManager.createRSSFile(
                repositories: [],
                languageTrendingLink: link,
                period: period,
                spokenLanguage: spokenLanguage,
                supportedEmojis: supportedEmojis
            )
        } catch {
            NSLog("⚠️ Failed to create an empty RSS file of \(link.name) "
                + "(\(spokenLanguage.rawValue), \(period.rawValue)). Error: \(error)")
        }
    }
}

private enum FeedGenerationOutcome {
    case fetched(isEmpty: Bool)
    case failed
}

@discardableResult
private func processFeed(
    target: FeedTarget,
    supportedEmojis: [GitHubEmoji],
    gitHubDownloader: GitHubDownloader,
    graphQLManager: GitHubGraphQLManager,
    feedManager: FeedFileCreator
) async -> FeedGenerationOutcome {
    let link = target.link
    do {
        let repositories = try await gitHubDownloader.fetchRepositories(
            ofLink: link,
            period: target.period,
            spokenLanguage: target.spokenLanguage,
            includesReadMeIfExists: Const.popularLanguages.contains(link.name)
        )

        var updatedRepositories = repositories
        if !repositories.isEmpty {
            let reposQueryInfo = repositories.map { (owner: $0.pageLink.userID, name: $0.pageLink.repositoryName) }

            do {
                let ogDataMap = try await graphQLManager.fetchRepositoriesOGImages(repositories: reposQueryInfo)
                for i in 0..<updatedRepositories.count {
                    let pageLink = updatedRepositories[i].pageLink
                    if let ogNode = ogDataMap["\(pageLink.userID)/\(pageLink.repositoryName)"] {
                        updatedRepositories[i].openGraphImageUrl = ogNode.openGraphImageUrl
                        updatedRepositories[i].usesCustomOpenGraphImage = ogNode.usesCustomOpenGraphImage
                    }
                }
            } catch {
                NSLog("⚠️ Failed to fetch GraphQL for \(link.name): \(error). Proceeding without OG Images.")
            }
        }

        try await feedManager.createRSSFile(
            repositories: updatedRepositories,
            languageTrendingLink: link,
            period: target.period,
            spokenLanguage: target.spokenLanguage,
            supportedEmojis: supportedEmojis
        )
        return .fetched(isEmpty: repositories.isEmpty)
    } catch {
        if let error = error as? DownloadManager.Error,
           error == .failedFetching(statusCode: 504) || error == .failedFetching(statusCode: 502) {
            // ignore
        } else {
            NSLog("⚠️ Failed to fetch repositories of \(link.name) (\(target.spokenLanguage.rawValue)). Error: \(error)")
        }
        return .failed
    }
}

do {
    try await start()
    NSLog("🎉 Finished fetching & generating feeds successfully")
    exit(0)
} catch {
    NSLog("🚨 Fatal Error: \(error)")
    exit(1)
}
