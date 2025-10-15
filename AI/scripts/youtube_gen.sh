#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $(basename "$0") <series_name>" >&2
  echo "Generates under repo's lib directory (000 overview + 001 + next.sh):" >&2
  echo "  input/script/{draft,final}, input/assets, output/{video,slides_html}, publish/links" >&2
}

if [[ ${1:-} == "-h" || ${1:-} == "--help" || $# -lt 1 ]]; then
  usage
  exit 0
fi

SERIES_NAME="$1"
# Resolve repo root relative to this script: AI/scripts -> repo root
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
LIB_DIR="$REPO_ROOT/lib"
# Ensure lib directory exists
mkdir -p "$LIB_DIR"
SERIES_DIR="$LIB_DIR/$SERIES_NAME"

# Initialize series directory and the first episode structure
if [[ -e "$SERIES_DIR" ]]; then
  echo "Series already exists: $SERIES_DIR"
else
  # Create series overview directory (000) on first initialization
  mkdir -p "$SERIES_DIR/000"
  touch "$SERIES_DIR/000/overview.md"
  echo "Initialized: $SERIES_DIR/000"

  mkdir -p "$SERIES_DIR/001/input/script/draft" \
           "$SERIES_DIR/001/input/script/final" \
           "$SERIES_DIR/001/input/assets" \
           "$SERIES_DIR/001/output/video" \
           "$SERIES_DIR/001/output/slides_html" \
           "$SERIES_DIR/001/publish/links"
  touch "$SERIES_DIR/001/title.md"
  echo "Initialized: $SERIES_DIR/001"
fi

# Write generic next.sh into the series directory
cat > "$SERIES_DIR/next.sh" << 'EOS'
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
    (( num = 10#"$n" ))
    (( num > max )) && max="$num"
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
EOS

chmod +x "$SERIES_DIR/next.sh"
echo "Series ready: $SERIES_DIR"
echo "Run: \"$SERIES_DIR/next.sh\" to add 002, 003, ..."