#!/usr/bin/env bash

set -ex

if [ -z "$USER_GITHUB_CLIENT_ID" ]; then
    echo "Please set the environment value 'USER_GITHUB_CLIENT_ID'." 1>&2
    exit 1
fi

if [ -z "$USER_GITHUB_CLIENT_SECRET" ]; then
    echo "Please set the environment value 'USER_GITHUB_CLIENT_SECRET'." 1>&2
    exit 1
fi

rm -rf output
swift run GitHubTrendingRSS --configuration=release --client-id="${USER_GITHUB_CLIENT_ID}" --client-secret="${USER_GITHUB_CLIENT_SECRET}"
cp -r static output
