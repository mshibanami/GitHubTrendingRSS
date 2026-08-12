# GitHub Trending RSS

<img alt="logo image" src="./website/public/img/logo.svg" width="100">

[![Generate feeds and publish data](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/generate_feeds.yml/badge.svg)](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/generate_feeds.yml)
[![Unit Test](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/test.yml/badge.svg)](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/test.yml)

This project generates RSS feeds for [GitHub Trending](https://github.com/trending) using GitHub Actions.

The feed jobs run daily. You can check the workflow status [here](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/generate_feeds.yml).

Feeds for some popular programming languages, such as Python and JavaScript, have more details than others. If your favorite language is not included in [this list](https://github.com/mshibanami/GitHubTrendingRSS/blob/master/Sources/GitHubTrendingRSSKit/Const.swift#L39), you can contribute by sending a pull request to add it. Alternatively, you can fork this repository and host your own feeds using GitHub Actions.

## Acknowledgements

This project uses the following open-source libraries and frameworks.

### Feed generator

- [Yaap](https://github.com/hartbit/Yaap)
- [Docsloth](https://github.com/mshibanami/Docsloth)
- [SwiftSoup](https://github.com/scinfu/SwiftSoup)
- [Stencil](https://github.com/stencilproject/Stencil)
- [Swift Algorithms](https://github.com/apple/swift-algorithms)

### Website

- [Svelte](https://svelte.dev/)
- [Vite](https://vite.dev/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Bits UI](https://bits-ui.com/)
- [Lucide](https://lucide.dev/)
- [Font Awesome Free](https://fontawesome.com/)
