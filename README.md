# GitHub Trending RSS

<img alt="logo image" src="./static/img/logo.svg" width="100">

[![Build Status](https://travis-ci.org/mshibanami/GitHubTrendingRSS.svg?branch=master)](https://travis-ci.org/mshibanami/GitHubTrendingRSS)

This is unofficial RSS feeds of [GitHub Trending](https://github.com/trending)

Travis CI runs this tool everyday and generated feeds are hosted on GitHub Pages. It means that you can check current feeds status [here](https://travis-ci.org/mshibanami/GitHubTrendingRSS).

Feeds of popular languages (e.g. JavaScript) has more detailed items than others. It's specified [here](https://github.com/mshibanami/GitHubTrendingRSS/blob/ea64981/Sources/GitHubTrendingRSSKit/Const.swift#L31). If you want to add other languages, please feel free to send a PR that adds them. Or just fork this repo and create a cron job for yours on Travis CI, then you can host your own feeds.
