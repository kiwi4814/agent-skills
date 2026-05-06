#!/usr/bin/env bash
set -euo pipefail

# Link every skill in this repository into the common user-level agent skill dirs.
# Usage:
#   ./scripts/link-macos.sh
#   ./scripts/link-macos.sh /path/to/skills-root

ROOT="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
DESTS=(
  "$HOME/.codex/skills"
  "$HOME/.claude/skills"
  "$HOME/.lingma/skills"
)

mkdir -p "${DESTS[@]}"

linked=0
skipped=0

for skill in "$ROOT"/*; do
  [ -d "$skill" ] || continue
  [ -f "$skill/SKILL.md" ] || continue
  name="$(basename "$skill")"

  for dest in "${DESTS[@]}"; do
    target="$dest/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "SKIP: $target exists and is not a symlink"
      skipped=$((skipped + 1))
      continue
    fi

    rm -f "$target"
    ln -s "$skill" "$target"
    echo "linked: $target -> $skill"
    linked=$((linked + 1))
  done
done

echo "done: linked=$linked skipped=$skipped root=$ROOT"
