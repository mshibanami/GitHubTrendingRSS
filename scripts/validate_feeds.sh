#!/usr/bin/env bash

set -ex
cd "$(dirname "${BASH_SOURCE:-$0}")/.."

output_path="${1:-output}"

if [ ! -d "$output_path" ]; then
    echo "Output folder not found: ${output_path}" >&2
    exit 1
fi

if ! command -v xmllint >/dev/null 2>&1; then
    echo "xmllint is required to validate RSS feeds." >&2
    exit 1
fi

if [ -z "$(find "$output_path" -type f -name '*.xml' -print -quit)" ]; then
    echo "No RSS feed files found under ${output_path}." >&2
    exit 1
fi

find "$output_path" -type f -name '*.xml' -exec xmllint --noout {} +
