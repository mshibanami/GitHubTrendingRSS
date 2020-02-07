#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE:-$0}")"

curl https://github.com/trending > TestResources/github.com_trending.html
curl https://github.com/trending/swift > TestResources/github.com_trending_swift.html
