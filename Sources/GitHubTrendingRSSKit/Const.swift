// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public class Const {
    public static let bundleIdentifier = "io.github.mshibanami.GitHubTrendingRSS"
  
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

    public private(set) static var gitHubClientID: String!
    public private(set) static var gitHubClientSecret: String!

    public static let populerLanguages = [
        "all",
        "applescript",
        "c",
        "c++",
        "c#",
        "common-lisp",
        "css",
        "dart",
        "dockerfile",
        "emacs-lisp",
        "f#",
        "go",
        "haskell",
        "haxe",
        "html",
        "java",
        "javascript",
        "jupyter-notebook",
        "kotlin",
        "lua",
        "objective-c",
        "perl",
        "php",
        "powershell",
        "python",
        "r",
        "ruby",
        "scala",
        "shell",
        "swift",
        "svg",
        "tex",
        "typescript",
        "xml",
        "xslt",
    ]

    public static func setup(gitHubClientID: String, gitHubClientSecret: String) {
        self.gitHubClientID = gitHubClientID
        self.gitHubClientSecret = gitHubClientSecret
    }
}
