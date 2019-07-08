// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public class FeedManager {
    public let siteGenerator: SiteGenerator
    public let rootOutputDirectory: URL

    public init(outputDirectory: URL, siteGenerator: SiteGenerator) {
        self.siteGenerator = siteGenerator
        self.rootOutputDirectory = outputDirectory
    }

    public func saveRSSFile(repositories: [Repository], languageTrendingLink: LanguageTrendingLink, period: Period) throws -> URL {
        let fileManager = FileManager.default
        let feedHTML = try siteGenerator.generateRSS(
            languageTrendingLink: languageTrendingLink,
            period: period,
            repositories: repositories)

        let outputDirectory = rootOutputDirectory.appendingPathComponent(period.rawValue)

        try fileManager.createDirectory(
            at: outputDirectory,
            withIntermediateDirectories: true,
            attributes: nil)

        let fileName = "\(languageTrendingLink.name).xml"
        let fileURL = outputDirectory.appendingPathComponent(fileName)

        guard fileManager.createFile(
            atPath: fileURL.path,
            contents: feedHTML.data(using: .utf8),
            attributes: nil) else {
                throw NSError()
        }

        return fileURL
    }

    public func saveRSSListFile(languageLinks: [LanguageTrendingLink]) throws -> URL {
        let fileManager = FileManager.default
        try fileManager.createDirectory(
            at: rootOutputDirectory,
            withIntermediateDirectories: true,
            attributes: nil)

        let html = try siteGenerator.generateHomeHTML(languageTrendingLinks: languageLinks)
        let fileURL = rootOutputDirectory.appendingPathComponent("index.html")

        guard fileManager.createFile(
            atPath: fileURL.path,
            contents: html.data(using: .utf8),
            attributes: nil) else {
                throw NSError()
        }

        return fileURL
    }
}
