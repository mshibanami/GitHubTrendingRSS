// swift-tools-version:4.2
// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import PackageDescription

let package = Package(
    name: "GitHubTrendingRSS",
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.1.0"),
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0"),
        .package(url: "https://github.com/iwasrobbed/Down.git", from: "0.8.5"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.2.0"),
    ],
    targets: [
        .target(
            name: "GitHubTrendingRSS",
            dependencies: [
              "GitHubTrendingRSSKit",
              "Logging",
              "SPMUtility",
          ]),
        .target(
            name: "GitHubTrendingRSSKit",
            dependencies: [
              "Logging",
              "Down",
              "RxSwift",
              "SwiftSoup",
          ]),
        .testTarget(
            name: "GitHubTrendingRSSTests",
            dependencies: [
                "GitHubTrendingRSSKit",
            ]),
    ]
)
