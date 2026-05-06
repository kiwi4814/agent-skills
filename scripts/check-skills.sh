#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../skills" && pwd)}"

echo "== canonical skills: $ROOT =="
find "$ROOT" -maxdepth 2 -name SKILL.md -print | sort

for dir in "$HOME/.codex/skills" "$HOME/.claude/skills" "$HOME/.lingma/skills"; do
  echo
  echo "== $dir =="
  if [ -d "$dir" ]; then
    find -L "$dir" -maxdepth 2 -name SKILL.md -print | sort
  else
    echo "missing"
  fi
done

echo
if command -v npx >/dev/null 2>&1; then
  echo "== npx skills global list =="
  npx -y skills list -g || true
else
  echo "npx not found; skip npx skills list"
fi
