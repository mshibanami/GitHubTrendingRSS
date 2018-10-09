// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation



public extension Array where Element == LanguageTrendingLink {
    public func rssListHTML() -> String? {
        let entityHTMLs = compactMap { element -> String? in
            let periodLinksHTML = Period.allCases.reduce("") {
                $0 + """
                    <a href="./\($1.rawValue)/\(element.name).xml" class="card-footer-item">
                        \($1.rawValue.capitalized)
                    </a>
                    """
            }

            return """
                <div class="column is-one-third">
                    <div class="card language">
                <div class="card-content">
                            <div class="media">
                                <div class="media-content has-text-centered">
                                    <p class="title is-4">\(element.displayName)</p>
                                </div>
                            </div>
                        </div>
                        <footer class="card-footer">
                            \(periodLinksHTML)
                        </footer>
                    </div>
                </div>
                """
        }

        let entriesString = entityHTMLs.reduce("") {
            $0 + $1
        }

        return """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <title>\(Const.pageTitle)</title>
                <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.css'>
                <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
                    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
                <link rel="stylesheet" href="./static/main.css">
            </head>
            <body>
                <a href="\(Const.gitHubRepositoryURL.absoluteString)">
                    <img style="position: absolute; top: 0; right: 0; border: 0;"
                         src="https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png"
                         alt="Fork me on GitHub">
                </a>
                <section class="hero is-info is-small">
                    <div class="hero-body">
                        <div class="container has-text-centered">
                            <p class="title">
                                \(Const.pageTitle)
                            </p>
                        </div>
                    </div>
                </section>
                <section class="container">
                    <div class="section">
                        <div class="row columns is-multiline">
                            \(entriesString)
                        </div>
                    </div>
                </section>
                <footer class="footer">
                    <div class="container">
                        <div class="content has-text-centered">
                            <a href="\(Const.gitHubRepositoryURL.absoluteString)">
                                <i class="fa fa-github-alt fa-2x" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </footer>
            </body>
            </html>
            """
    }
}
