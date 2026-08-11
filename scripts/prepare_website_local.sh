#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

WEBSITE_GENERATED="website/src/lib/generated"

node scripts/generate_website_manifest.mjs \
    website/src/lib/local-feed-manifest.json \
    "${WEBSITE_GENERATED}/feed-manifest.ts"
node scripts/generate_website_entry_counts.mjs \
    website/public \
    "${WEBSITE_GENERATED}/feed-entry-counts.ts" \
    --allow-empty
