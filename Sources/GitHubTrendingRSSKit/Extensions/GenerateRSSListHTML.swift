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
                                    <p class="title is-4">
                                        \(element.displayName)
                                    </p>
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

        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let latestBuildDate = formatter.string(from: Date())

        return """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="utf-8" />
                <meta content="IE=edge" http-equiv="X-UA-Compatible" />
                <meta content="width=device-width, initial-scale=1" name="viewport" />
                <meta content="\(Const.author)" name="author" />
                <meta content="website" property="og:type" />
                <meta content="\(Const.pageTitle)" property="og:title" />
                <meta content="./static/img/favicon-196.png" property="og:image" />
                <meta content="\(Const.rssHomeURL)" property="og:url" />
                <meta content="en_US" property="og:locale" />
                <title>\(Const.pageTitle)</title>
                <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.css'>
                <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
                <link rel="stylesheet" href="./static/css/main.css">
                <link href="./static/img/favicon-196.png" rel="shortcut icon" type="image/png" />
                <link href="./static/img/favicon-196.png" rel="shortcut icon" sizes="196x196" />
                <link href="./static/img/favicon-196.png" rel="apple-touch-icon" />
                \(Const.googleAnalyticsTrackingCode)
            </head>
            <body>
                <section class="hero is-info is-small">
                    <div class="hero-body">
                        <div class="container has-text-centered">
                            <p class="title">
                                \(Const.pageTitle)
                            </p>
                            <div class="content">
                                <p>
                                    <a href="https://travis-ci.org/mshibanami/GitHubTrendingRSS">
                                        <img src="https://travis-ci.org/mshibanami/GitHubTrendingRSS.svg?branch=master">
                                    </a>
                                    <a class="github-button" href="https://github.com/mshibanami/GitHubTrendingRSS" data-size="small" data-show-count="true" aria-label="Star mshibanami/GitHubTrendingRSS on GitHub">
                                        Star
                                    </a>
                                </p>
                                <p>The latest build: \(latestBuildDate)</p>
                            </div>
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

                <script async defer src="https://buttons.github.io/buttons.js"></script>
            </body>
            </html>
            """
    }
}
