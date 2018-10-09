// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public class Const {
    public static let rssHomeURL = "http://mshibanami.github.io/GitHubTrendingRSS"
    public static let baseURL = URL(string: "https://github.com")!
    public static let apiBaseURL = URL(string: "https://api.github.com")!
    public static let topTrendingURL = URL(string: "\(baseURL)/trending")!
    public static let gitHubRepositoryURL = URL(string: "https://github.com/mshibanami/GitHubTrendingRSS")!
    
    public static let pageTitle = "GitHub Trending RSS"
    
    public static let outputDirectoryName = "output"
    public static let outputDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        .appendingPathComponent(outputDirectoryName)
}
