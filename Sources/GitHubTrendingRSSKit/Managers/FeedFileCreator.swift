// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public final class FeedFileCreator: @unchecked Sendable {
    public let siteGenerator: SiteSourceMaker
    public let rootOutputDirectory: URL

    public init(outputDirectory: URL, siteGenerator: SiteSourceMaker) {
        self.siteGenerator = siteGenerator
        rootOutputDirectory = outputDirectory
    }

    @discardableResult public func createRSSFile(
        repositories: [Repository], languageTrendingLink: LanguageTrendingLink, period: Period,
        spokenLanguage: SpokenLanguage, supportedEmojis: [GitHubEmoji]
    ) async throws -> URL {
        let fileManager = FileManager.default
        let feedHTML = try await siteGenerator.makeRSS(
            from: languageTrendingLink,
            period: period,
            spokenLanguage: spokenLanguage,
            repositories: repositories,
            supportedEmojis: supportedEmojis
        )

        let outputDirectory = spokenLanguage.outputDirectory(
            relativeTo: rootOutputDirectory, period: period
        )

        try fileManager.createDirectory(
            at: outputDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )

        let fileName = "\(languageTrendingLink.name).xml"
        let fileURL = outputDirectory.appendingPathComponent(fileName)

        guard
            fileManager.createFile(
                atPath: fileURL.path,
                contents: feedHTML.data(using: .utf8),
                attributes: nil
            ) else {
            throw NSError()
        }

        return fileURL
    }

    public func createFeedManifestFile(languageLinks: [LanguageTrendingLink]) throws -> URL {
        let fileManager = FileManager.default
        try fileManager.createDirectory(
            at: rootOutputDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )

        let manifest = FeedManifest(languageTrendingLinks: languageLinks)
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(manifest)
        let fileURL = rootOutputDirectory.appendingPathComponent("feed-manifest.json")

        guard
            fileManager.createFile(
                atPath: fileURL.path,
                contents: data,
                attributes: nil
            ) else {
            throw NSError()
        }

        return fileURL
    }

    public func copyAssetsDirectory() throws {
        let fileManager = FileManager.default
        let sourceAssetsURL = Const.resourcesRootURL.appendingPathComponent("assets")
        let destinationAssetsURL = rootOutputDirectory.appendingPathComponent("assets")

        guard fileManager.fileExists(atPath: sourceAssetsURL.path) else {
            return
        }

        try fileManager.createDirectory(
            at: rootOutputDirectory, withIntermediateDirectories: true, attributes: nil
        )

        if fileManager.fileExists(atPath: destinationAssetsURL.path) {
            try fileManager.removeItem(at: destinationAssetsURL)
        }

        try fileManager.copyItem(at: sourceAssetsURL, to: destinationAssetsURL)
    }

    @discardableResult public func createDeveloperRSSFile(
        developers: [Developer],
        languageTrendingLink: LanguageTrendingLink,
        period: Period,
        supportedEmojis: [GitHubEmoji]
    ) async throws -> URL {
        let fileManager = FileManager.default
        let feedHTML = try await siteGenerator.makeDeveloperRSS(
            from: languageTrendingLink,
            period: period,
            developers: developers,
            supportedEmojis: supportedEmojis
        )

        let outputDirectory =
            rootOutputDirectory
                .appendingPathComponent("developers")
                .appendingPathComponent(period.rawValue)

        try fileManager.createDirectory(
            at: outputDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )

        let fileName = "\(languageTrendingLink.name).xml"
        let fileURL = outputDirectory.appendingPathComponent(fileName)

        guard
            fileManager.createFile(
                atPath: fileURL.path,
                contents: feedHTML.data(using: .utf8),
                attributes: nil
            ) else {
            throw NSError()
        }

        return fileURL
    }
}
