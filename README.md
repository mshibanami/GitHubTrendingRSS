# GitHub Trending RSS

<img alt="logo image" src="./website/public/img/logo.svg" width="100">

[![Generate feeds and deploy website](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/generate_feeds.yml/badge.svg)](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/generate_feeds.yml)
[![Unit Test](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/test.yml/badge.svg)](https://github.com/mshibanami/GitHubTrendingRSS/actions/workflows/test.yml)

This project generates RSS feeds for [GitHub Trending](https://github.com/trending) using GitHub Actions.

The feed jobs run daily on macOS runners. A separate Ubuntu job receives the feed artifacts, builds the Vite + Svelte 5 website in `website/`, and deploys the resulting static files to GitHub Pages. You can check the workflow status [here](https://github.com/mshibanami/GitHubTrendingRSS/actions?query=workflow%3A%22Generate+feeds+and+deploy+website%22).

## Website

The website is a standalone Vite + Svelte 5 application. It receives the generated `feed-manifest.json` and RSS files from CI; it does not fetch GitHub data in the browser.

```sh
cd website
corepack enable
corepack pnpm install
corepack pnpm dev
```

For a production build:

```sh
VITE_BASE_PATH=/GitHubTrendingRSS/ corepack pnpm build
```

When feed artifacts are not present locally, `check` and `build` generate local preview data automatically. CI generates the same files from the downloaded feed artifacts before deployment.

Formatting is handled by Prettier:

```sh
corepack pnpm format
corepack pnpm format:check
```

The Swift generator writes the feed artifact and its manifest to `output/`. The Ubuntu CI job copies those files into the website's public directory before running Vite. The generated site is written to `website/dist/`.

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
