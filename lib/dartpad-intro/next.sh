#!/usr/bin/env bash
set -euo pipefail

# Determine the series directory (this script's directory)
SERIES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Collect existing three-digit episode directories
shopt -s nullglob
nums=()
for d in "$SERIES_DIR"/*; do
  base="$(basename "$d")"
  if [[ -d "$d" && "$base" =~ ^[0-9]{3}$ ]]; then
    nums+=("$base")
  fi
done

# Compute next episode number
if [[ ${#nums[@]} -eq 0 ]]; then
  next_num=1
else
  max=0
  for n in "${nums[@]}"; do
    num=$((10#"$n"))
    if (( num > max )); then
      max="$num"
    fi
  done
  next_num=$((max + 1))
fi

next_dir=$(printf "%s/%03d" "$SERIES_DIR" "$next_num")

# Create standard structure for the next episode
mkdir -p "$next_dir/input/script/draft" \
         "$next_dir/input/script/final" \
         "$next_dir/input/assets" \
         "$next_dir/output/video" \
         "$next_dir/output/slides_html" \
         "$next_dir/publish/links"
touch "$next_dir/title.md"

echo "Created: $next_dir"
