// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public class Const {
    public static let rssHomeURL = URL(string: "http://mshibanami.github.io/GitHubTrendingRSS")!
    public static let gitHubAPIBaseURL = URL(string: "https://api.github.com")!
    public static let gitHubTopTrendingURL = URL(string: "\(gitHubBaseURL)/trending")!
    public static let gitHubBaseURL = URL(string: "https://github.com")!
    public static let gitHubRepositoryURL = URL(string: "https://github.com/mshibanami/GitHubTrendingRSS")!

    public static let pageTitle = "GitHub Trending RSS"
    public static let author = "Manabu Nakazawa"

    public static let outputDirectoryName = "output"
    public static let outputDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        .appendingPathComponent(outputDirectoryName)

    public static let googleAnalyticsTrackingCode = """
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-46019833-3"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', 'UA-46019833-3');
        </script>
        """
    
    public static let gitHubClientID = CommandLine.arguments[0]
    public static let gitHubClientSecret = CommandLine.arguments[1]
}
