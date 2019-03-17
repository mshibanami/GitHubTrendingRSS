#!/usr/bin/env bash

set -x

rm -rf output
swift test
swift run GitHubTrendingRSS "${GITHUB_CLIENT_ID}" "${GITHUB_CLIENT_SECRET}"
cp -r static output
