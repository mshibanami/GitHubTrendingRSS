// swift-tools-version:5.1
// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import PackageDescription

let package = Package(
    name: "GitHubTrendingRSS",
    platforms: [
        .macOS(.v10_14)
    ],
    dependencies: [
        .package(url: "https://github.com/hartbit/Yaap.git", from: "1.0.0"),
        .package(url: "https://github.com/iwasrobbed/Down.git", from: "0.9.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.1"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.2.2"),
        .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.13.1"),
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
              "RxSwift",
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
