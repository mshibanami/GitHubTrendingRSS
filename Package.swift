// swift-tools-version:5.1
// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import PackageDescription

let package = Package(
    name: "GitHubTrendingRSS",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/hartbit/Yaap", from: "1.0.0"),
        .package(url: "https://github.com/hebertialmeida/MarkdownSyntax", from: "1.1.0"),
        .package(url: "https://github.com/scinfu/SwiftSoup", from: "2.3.2"),
        .package(url: "https://github.com/stencilproject/Stencil", from: "0.14.1"),
        .package(url: "https://github.com/mshibanami/SwiftAsciidoctor", from: "1.0.2"),
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0"),
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
              "MarkdownSyntax",
              "Stencil",
              "SwiftSoup",
              "SwiftAsciidoctor",
              "Algorithms",
          ]),
        .testTarget(
            name: "GitHubTrendingRSSTests",
            dependencies: [
                "GitHubTrendingRSSKit",
            ]),
    ],
    swiftLanguageVersions: [.v5]
)
