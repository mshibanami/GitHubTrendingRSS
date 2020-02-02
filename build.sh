#!/usr/bin/env bash

set -ex

if [ -z "${secrets.USER_GITHUB_CLIENT_ID}" ]; then
    echo "Please set the environment value 'secrets.USER_GITHUB_CLIENT_ID'." 1>&2
    exit 1
fi

if [ -z "${secrets.USER_GITHUB_CLIENT_SECRET}" ]; then
    echo "Please set the environment value 'secrets.USER_GITHUB_CLIENT_SECRET'." 1>&2
    exit 1
fi

rm -rf output
swift run GitHubTrendingRSS --configuration=release --client-id="${secrets.USER_GITHUB_CLIENT_ID}" --client-secret="${secrets.USER_GITHUB_CLIENT_SECRET}"
cp -r static output
