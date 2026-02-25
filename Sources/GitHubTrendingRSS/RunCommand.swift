// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit
import Yaap

class RunCommand: Command {
    let name = "run"
    let help = Help()

    @Option(name: "configuration", shorthand: "c", documentation: "(Dummy. Reserved by Swift.)")
    var configuration: String = ""

    @Option(name: "github-token", documentation: "GitHub's Personal Access Token (for GraphQL API)")
    var githubToken: String = ""

    func run(outputStream: inout TextOutputStream, errorStream: inout TextOutputStream) throws {
        Const.setup(githubToken: githubToken)
    }
}
