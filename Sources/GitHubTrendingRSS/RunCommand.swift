// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit
import Yaap

class RunCommand: Command {
    let name = "run"
    let help = Help()

    @Option(name: "configuration", shorthand: "c", documentation: "(Dummy. Reserved by Swift.)")
    var configuration: String = ""

    @Option(name: "client-id", documentation: "GitHub's client ID")
    var clientID: String = ""
    
    @Option(name: "client-secret", documentation: "GitHub's client secret")
    var clientSecret: String = ""
    
    func run(outputStream: inout TextOutputStream, errorStream: inout TextOutputStream) throws {
        Const.setup(gitHubClientID: clientID, gitHubClientSecret: clientSecret)
    }
}
