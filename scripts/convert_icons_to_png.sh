#!/usr/bin/env bash

set -euo pipefail

script_directory="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repository_directory="$(cd -- "${script_directory}/.." && pwd)"
icons_directory="${repository_directory}/Sources/GitHubTrendingRSSKit/Resources/assets/icons"

if ! command -v rsvg-convert >/dev/null 2>&1; then
    echo "rsvg-convert is required to convert SVG icons to PNG." >&2
    echo "Install it with: brew install librsvg" >&2
    exit 1
fi

if [ ! -d "${icons_directory}" ]; then
    echo "Icon directory not found: ${icons_directory}" >&2
    exit 1
fi

find "${icons_directory}" -maxdepth 1 -type f -name '*.png' -delete

converted_count=0
while IFS= read -r svg_path; do
    icon_filename="${svg_path##*/}"
    icon_name="${icon_filename%.svg}"
    png_path="${icons_directory}/${icon_name}.png"
    rsvg-convert \
        --width 40 \
        --height 40 \
        --keep-aspect-ratio \
        --output "${png_path}" \
        "${svg_path}"
    converted_count=$((converted_count + 1))
done < <(find "${icons_directory}" -maxdepth 1 -type f -name '*.svg' -print | sort)

if [ "${converted_count}" -eq 0 ]; then
    echo "No SVG icons were found in ${icons_directory}." >&2
    exit 1
fi

echo "Converted ${converted_count} SVG icons to PNG in ${icons_directory}."
