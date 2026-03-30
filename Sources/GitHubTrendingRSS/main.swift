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

let parallelDownloadChunk = 4
let downloadManager = DownloadManager()
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
    async let topTrendingPageTask = gitHubDownloader.fetchTopTrendingPage()
    async let supportedEmojisTask = gitHubDownloader.fetchSupportedEmojis()

    let (topTrendingPage, supportedEmojis) = try await (topTrendingPageTask, supportedEmojisTask)
    
    let languageLinks = try gitHubPageParser.languageTrendingLinks(fromTopTrendingPage: topTrendingPage)
    guard !languageLinks.isEmpty else {
        throw MainError.noLanguageTrendingLinks
    }

    for period in Period.allCases {
        let chunkedLinks = languageLinks.chunked(into: parallelDownloadChunk)
        
        for chunk in chunkedLinks {
            await withTaskGroup(of: Void.self) { group in
                for link in chunk {
                    group.addTask {
                        do {
                            let repositories = try await gitHubDownloader.fetchRepositories(
                                ofLink: link,
                                period: period,
                                includesReadMeIfExists: Const.popularLanguages.contains(link.name)
                            )
                            
                            var updatedRepositories = repositories
                            if !repositories.isEmpty {
                                let reposQueryInfo = repositories.map { (owner: $0.pageLink.userID, name: $0.pageLink.repositoryName) }
                                
                                do {
                                    let ogDataMap = try await graphQLManager.fetchRepositoriesOGImages(repositories: reposQueryInfo)
                                    for i in 0..<updatedRepositories.count {
                                        if let ogNode = ogDataMap["repo_\(i)"] {
                                            updatedRepositories[i].openGraphImageUrl = ogNode.openGraphImageUrl
                                            updatedRepositories[i].usesCustomOpenGraphImage = ogNode.usesCustomOpenGraphImage
                                        }
                                    }
                                } catch {
                                    NSLog("⚠️ Failed to fetch GraphQL for \(link.name): \(error). Proceeding without OG Images.")
                                }
                            }
                            
                            try feedManager.createRSSFile(
                                repositories: updatedRepositories,
                                languageTrendingLink: link,
                                period: period,
                                supportedEmojis: supportedEmojis
                            )
                        } catch {
                            if let error = error as? DownloadManager.Error,
                               error == .failedFetching(statusCode: 504) || error == .failedFetching(statusCode: 502) {
                                // ignore
                            } else {
                                NSLog("⚠️ Failed to fetch repositories of \(link.name). Error: \(error)")
                            }
                        }
                    }
                }
            }
            
            _ = try? feedManager.createRSSListFile(languageLinks: languageLinks)
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
