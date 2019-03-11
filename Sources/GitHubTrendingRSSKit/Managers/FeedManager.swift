// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public class FeedManager {
    public let rootOutputDirectory: URL

    public init(outputDirectory: URL) {
        self.rootOutputDirectory = outputDirectory
    }

    public func saveRSSFile(fromRepositories repositories: [Repository],
                        languageTrendingLink: LanguageTrendingLink,
                        period: Period) throws -> URL {
        let fileManager = FileManager.default
        let feedHTML = repositories.feedHTML(
            ofLanguage: languageTrendingLink,
            period: period)

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

        guard let html = languageLinks.rssListHTML() else {
            throw NSError()
        }

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
