// swift-tools-version:5.1
// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import PackageDescription

let package = Package(
    name: "GitHubTrendingRSS",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/hartbit/Yaap.git", from: "1.0.0"),
        .package(url: "https://github.com/iwasrobbed/Down.git", from: "0.10.0"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.3.2"),
        .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.14.1"),
    ],
    targets: [
        .target(
            name: "GitHubTrendingRSS",
            dependencies: [
              "GitHubTrendingRSSKit",
              "Yaap",
          ]),
        .target(
            name: "GitHubTrendingRSSKit",
            dependencies: [
              "Down",
              "Stencil",
              "SwiftSoup",
          ]),
        .testTarget(
            name: "GitHubTrendingRSSTests",
            dependencies: [
                "GitHubTrendingRSSKit",
            ]),
    ],
    swiftLanguageVersions: [.v5]
)
