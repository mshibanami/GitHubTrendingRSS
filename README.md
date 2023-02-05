# GitHub Trending RSS

<img alt="logo image" src="./static/img/logo.svg" width="100">

[![Fetch and Generate RSS Feeds](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/generate_feeds.yml/badge.svg)](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/generate_feeds.yml)
[![Unit Test](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/test.yml/badge.svg)](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/test.yml)

This project generates RSS feeds for [GitHub Trending](https://github.com/trending) using GitHub Actions.

These actions run daily to create the feeds, which are then hosted on GitHub Pages. You can check their status [here](https://github.com/mshibanami/GitHubTrendingRSS/actions?query=workflow%3A%22Fetch+and+Generate+RSS+Feeds%22).

Feeds for some popular programming languages, such as Python and JavaScript, have more details than others. If your favorite language is not included in [this list](https://github.com/mshibanami/GitHubTrendingRSS/blob/master/Sources/GitHubTrendingRSSKit/Const.swift#L39), you can contribute by sending a pull request to add it. Alternatively, you can fork this repository and host your own feeds using GitHub Actions.

## Acknowledgements

- [stencilproject / Stencil](https://github.com/stencilproject/Stencil)
- [kylef / PathKit](https://github.com/kylef/PathKit)
- [scinfu / SwiftSoup](https://github.com/scinfu/SwiftSoup)
- [hebertialmeida / MarkdownSyntax](https://github.com/hebertialmeida/MarkdownSyntax)
- [hartbit / Yaap](https://github.com/hartbit/Yaap)
- [jgthms / bulma](https://github.com/jgthms/bulma)
- [mshibanami / SwiftAsciidoctor](https://github.com/mshibanami/SwiftAsciidoctor)
