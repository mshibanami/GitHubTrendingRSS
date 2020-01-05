#!/usr/bin/env bash

set -e
cd "$(dirname "${BASH_SOURCE:-$0}")"

BRANCH_NAME="gh-pages"
OUTPUT_PATH="output"
GIT_USER_EMAIL="mshibanami+git@gmail.com"
GIT_USER_NAME="Manabu Nakazawa"

if [ -z "$GITHUB_TOKEN" ]; then
    echo "Please set the environment value 'GITHUB_TOKEN'." 1>&2
    exit 1
fi

if [ -f "$OUTPUT_PATH" ]; then
    echo "Output folder not found: ${OUTPUT_PATH}" 1>&2
    exit 1
fi

GIT_REPO_URL="https://mshibanami:${GITHUB_TOKEN}@github.com/mshibanami/GitHubTrendingRSS.git"

cd output

git init
git config --global user.email "${GIT_USER_EMAIL}"
git config --global user.name "${GIT_USER_NAME}"
git checkout -b "${BRANCH_NAME}"
git remote add origin "${GIT_REPO_URL}"
git add .
git commit -m "Deploy with deploy.sh"
git remote set-url origin --push "${GIT_REPO_URL}"
git push --set-upstream origin --force "${BRANCH_NAME}"
