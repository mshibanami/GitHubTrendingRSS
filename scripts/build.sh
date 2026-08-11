#!/usr/bin/env bash

set -ex

cd "$(dirname "${BASH_SOURCE:-$0}")/.."

if [ -z "$GITHUB_TOKEN" ]; then
    echo "Please set the environment value 'GITHUB_TOKEN'." 1>&2
    exit 1
fi

TARGET="all"
while [[ $# -gt 0 ]]; do
    case "$1" in
        --target=*)
            TARGET="${1#*=}"
            shift
            ;;
        --target)
            if [[ -n "$2" ]]; then
                TARGET="$2"
                shift 2
            else
                shift
            fi
            ;;
        *)
            shift
            ;;
    esac
done

rm -rf output
swift run GitHubTrendingRSS --configuration=release --github-token="${GITHUB_TOKEN}" --target="${TARGET}"

