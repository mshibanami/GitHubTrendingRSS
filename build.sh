#!/usr/bin/env bash

set -ex

rm -rf output
swift run GitHubTrendingRSS --client-id="${GITHUB_CLIENT_ID}" --client-secret="${GITHUB_CLIENT_SECRET}"
cp -r static output
