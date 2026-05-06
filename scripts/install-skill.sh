#!/usr/bin/env bash
set -euo pipefail

# Install an open-source skill using npx skills, then link it to Codex/Claude/Lingma.
# Examples:
#   ./scripts/install-skill.sh vercel-labs/agent-skills --skill frontend-design
#   ./scripts/install-skill.sh https://github.com/vercel-labs/agent-skills --skill find-skills

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <repo-or-url> [--skill <skill-name>] [other npx skills add args...]" >&2
  exit 2
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

npx -y skills add "$@" -g -a claude-code -a codex -y
"$SCRIPT_DIR/link-macos.sh"
"$SCRIPT_DIR/check-skills.sh"
