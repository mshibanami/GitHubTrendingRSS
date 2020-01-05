# GitHub Trending RSS

<img alt="logo image" src="./static/img/logo.svg" width="100">

[![Build Status](https://travis-ci.org/mshibanami/GitHubTrendingRSS.svg?branch=master)](https://travis-ci.org/mshibanami/GitHubTrendingRSS)

This is a RSS feed generator for [GitHub Trending](https://github.com/trending).

**Ideally** Travis CI runs this tool everyday and generated feeds are hosted on GitHub Pages. It means you can check current feeds' status [here](https://travis-ci.org/mshibanami/GitHubTrendingRSS).
However, since GitHub Trending became bigger than before and the build job easily exceeds timeout limit, currently the job is also run on Jenkins on @mshibanami's Macbook as a workaround. You can see the current progress here: https://github.com/mshibanami/GitHubTrendingRSS/issues/4

Feeds of some popular languages (e.g. JavaScript) have more detailed items than others. It's specified [here](https://github.com/mshibanami/GitHubTrendingRSS/blob/ea64981/Sources/GitHubTrendingRSSKit/Const.swift#L31). Please feel free to send a PR that adds another language if your favourite one isn't there, or just fork this repo and create a cron job for it on Travis CI to host your own feeds.

## Development

Run this if you use Xcode:

```sh
swift package generate-xcodeproj --xcconfig-overrides Settings.xcconfig
```
