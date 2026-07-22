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

let maxConcurrentFeedGenerations = 16
let downloadManager = DownloadManager(
    maxConcurrentRequestsByHost: [Const.gitHubBaseURL.host ?? "github.com": 2]
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

    let feedTargets: [FeedTarget] = SpokenLanguage.allCases.flatMap { spokenLanguage in
        Period.allCases.flatMap { period in
            languageLinks.map { link in
                FeedTarget(spokenLanguage: spokenLanguage, period: period, link: link)
            }
        }
    }

    try await feedTargets.forEachConcurrent(maxConcurrency: maxConcurrentFeedGenerations) { target in
        await processFeed(
            target: target,
            supportedEmojis: supportedEmojis,
            gitHubDownloader: gitHubDownloader,
            graphQLManager: graphQLManager,
            feedManager: feedManager
        )
    }

    _ = try? feedManager.createRSSListFile(languageLinks: languageLinks)
}

private func processFeed(
    target: FeedTarget,
    supportedEmojis: [GitHubEmoji],
    gitHubDownloader: GitHubDownloader,
    graphQLManager: GitHubGraphQLManager,
    feedManager: FeedFileCreator
) async {
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
    } catch {
        if let error = error as? DownloadManager.Error,
           error == .failedFetching(statusCode: 504) || error == .failedFetching(statusCode: 502) {
            // ignore
        } else {
            NSLog("⚠️ Failed to fetch repositories of \(link.name) (\(target.spokenLanguage.rawValue)). Error: \(error)")
        }
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
