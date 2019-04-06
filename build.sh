#!/usr/bin/env bash

set -ex

rm -rf output
swift run GitHubTrendingRSS "${GITHUB_CLIENT_ID}" "${GITHUB_CLIENT_SECRET}"
cp -r static output
