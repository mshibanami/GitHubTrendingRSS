// swift-tools-version:4.2
// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import PackageDescription

let package = Package(
    name: "GitHubTrendingRSS",
    dependencies: [
        .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "4.0.3"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "4.4.1"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-Markdown.git", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "GitHubTrendingRSS",
            dependencies: ["GitHubTrendingRSSKit"]),
        .target(
            name: "GitHubTrendingRSSKit",
            dependencies: ["Kanna", "RxSwift", "PerfectMarkdown"]),
        .testTarget(
            name: "GitHubTrendingRSSTests",
            dependencies: ["GitHubTrendingRSSKit"]),
    ]
)
