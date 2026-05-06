#!/usr/bin/env bash
set -euo pipefail

# Append unified skills-management rules to Codex and Claude Code global instruction files.
# Lingma's global rules are IDE-version dependent, so this script writes a copy you can paste.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RULES="$ROOT/docs/agent-global-rules.md"
CODEX_FILE="$HOME/.codex/AGENTS.md"
CLAUDE_FILE="$HOME/.claude/CLAUDE.md"
LINGMA_PASTE="$ROOT/docs/lingma-global-rules-to-paste.md"

mkdir -p "$HOME/.codex" "$HOME/.claude" "$(dirname "$LINGMA_PASTE")"

append_once() {
  local file="$1"
  local marker="$2"
  if [ -f "$file" ] && grep -qF "$marker" "$file"; then
    echo "exists: $file already contains $marker"
    return
  fi
  {
    echo
    echo "$marker"
    cat "$RULES"
  } >> "$file"
  echo "updated: $file"
}

append_once "$CODEX_FILE" "<!-- agent-skills-manager-rules:start -->"
append_once "$CLAUDE_FILE" "<!-- agent-skills-manager-rules:start -->"
cp "$RULES" "$LINGMA_PASTE"

echo "Lingma: paste this file into Lingma global/custom rules if needed: $LINGMA_PASTE"
