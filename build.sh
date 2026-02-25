#!/usr/bin/env bash

set -ex

if [ -z "$GITHUB_TOKEN" ]; then
    echo "Please set the environment value 'GITHUB_TOKEN'." 1>&2
    exit 1
fi

rm -rf output
swift run GitHubTrendingRSS --configuration=release --github-token="${GITHUB_TOKEN}"
cp -r static output
