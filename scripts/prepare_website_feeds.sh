#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

ARTIFACT_ROOT="${1:-.artifacts}"
REPOSITORY_ARTIFACT="${ARTIFACT_ROOT}/repos"
DEVELOPER_ARTIFACT="${ARTIFACT_ROOT}/developers"

if [ -f "${ARTIFACT_ROOT}/feed-manifest.json" ]; then
    REPOSITORY_ARTIFACT="${ARTIFACT_ROOT}"
    DEVELOPER_ARTIFACT="${ARTIFACT_ROOT}"
fi

if [ -f "${REPOSITORY_ARTIFACT}/output/feed-manifest.json" ]; then
    REPOSITORY_ARTIFACT="${REPOSITORY_ARTIFACT}/output"
fi

if [ -d "${DEVELOPER_ARTIFACT}/output/developers" ]; then
    DEVELOPER_ARTIFACT="${DEVELOPER_ARTIFACT}/output"
fi

if [ ! -f "${REPOSITORY_ARTIFACT}/feed-manifest.json" ]; then
    echo "Repository feed artifact is missing feed-manifest.json." >&2
    exit 1
fi

for directory in daily weekly monthly en assets; do
    if [ ! -d "${REPOSITORY_ARTIFACT}/${directory}" ]; then
        echo "Repository feed artifact is missing ${directory}/." >&2
        exit 1
    fi
done

if [ ! -d "${DEVELOPER_ARTIFACT}/developers" ]; then
    echo "Developer feed artifact is missing developers/." >&2
    exit 1
fi

WEBSITE_PUBLIC="website/public"

for directory in daily weekly monthly en developers assets; do
    rm -rf "${WEBSITE_PUBLIC:?}/${directory}"
done

for directory in daily weekly monthly en assets; do
    cp -R "${REPOSITORY_ARTIFACT}/${directory}" "${WEBSITE_PUBLIC}/${directory}"
done

cp -R "${DEVELOPER_ARTIFACT}/developers" "${WEBSITE_PUBLIC}/developers"

cp "${REPOSITORY_ARTIFACT}/feed-manifest.json" "${WEBSITE_PUBLIC}/feed-manifest.json"
node scripts/generate_website_manifest.mjs \
    "${REPOSITORY_ARTIFACT}/feed-manifest.json" \
    website/src/lib/generated/feed-manifest.ts
node scripts/generate_website_entry_counts.mjs \
    website/public \
    website/src/lib/generated/feed-entry-counts.ts
