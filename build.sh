#!/usr/bin/env bash

set -ex

rm -rf output
swift run GitHubTrendingRSS --configuration=release --client-id="${USER_GITHUB_CLIENT_ID}" --client-secret="${USER_GITHUB_CLIENT_SECRET}"
cp -r static output
