#!/usr/bin/env bash
#
# install-commands.sh — register the /value-role-* slash commands in each
# Agent harness so they show up in the chat box.
#
# The canonical command files live in this repo at ./commands/*.md. Each
# harness discovers slash commands from a different place, so this script
# links (or copies) those files into every harness's expected directory.
#
# Coverage:
#   Claude Code  -> ~/.claude/commands/        (user commands)  [also via plugin]
#   ZCode        -> ~/.zcode/commands/         (user commands)  [also via plugin]
#   Kilo         -> ~/.config/kilo/command/    (global commands)
#   Codex        -> Supported via SKILL.md     ($value-role-* skills in skills/)
#
# For Claude Code and ZCode the recommended path is to install this repo as a
# plugin (see README "Option 2"); the plugin's root ./commands/ is then read
# automatically and this script is not required. This script is for users who
# installed via the Skills CLI (Option 1) or who want the commands available
# globally outside any single project. For Codex, each role already ships as a
# SKILL.md in skills/value-role-*/ and is discovered automatically by the
# npx skills CLI — no extra step is needed.
#
# Usage:
#   scripts/install-commands.sh              # symlink into all supported harnesses
#   scripts/install-commands.sh --copy       # copy instead of symlink
#   scripts/install-commands.sh --uninstall  # remove the links/copies
#   scripts/install-commands.sh --target kilo --target claude   # restrict targets
#
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$REPO/commands"

if [ ! -d "$SRC" ]; then
  echo "error: $SRC not found (run from the repo root)." >&2
  exit 1
fi

MODE="link"
UNINSTALL=0
TARGETS=()

while [ $# -gt 0 ]; do
  case "$1" in
    --copy)        MODE="copy"; shift ;;
    --uninstall)   UNINSTALL=1; shift ;;
    --target)      TARGETS+=("$2"); shift 2 ;;
    --target=*)    TARGETS+=("${1#--target=}"); shift ;;
    -h|--help)
      sed -n '2,30p' "${BASH_SOURCE[0]}"
      exit 0 ;;
    *) echo "unknown arg: $1" >&2; exit 1 ;;
  esac
done

# target_name|dest_dir
ALL_TARGETS=(
  "claude|$HOME/.claude/commands"
  "zcode|$HOME/.zcode/commands"
  "kilo|$HOME/.config/kilo/command"
)

is_enabled() {
  local name="$1"
  if [ "${#TARGETS[@]}" -eq 0 ]; then return 0; fi
  for t in "${TARGETS[@]}"; do [ "$t" = "$name" ] && return 0; done
  return 1
}

for entry in "${ALL_TARGETS[@]}"; do
  name="${entry%%|*}"
  dest="${entry#*|}"
  if ! is_enabled "$name"; then continue; fi

  if [ "$UNINSTALL" -eq 1 ]; then
    for f in "$SRC"/*.md; do
      b="$(basename "$f")"
      if [ -e "$dest/$b" ] || [ -L "$dest/$b" ]; then rm -f "$dest/$b"; fi
    done
    echo "[$name] removed commands from $dest"
    continue
  fi

  mkdir -p "$dest"
  for f in "$SRC"/*.md; do
    b="$(basename "$f")"
    target="$dest/$b"
    # clear stale link/copy first so re-runs are idempotent
    [ -L "$target" ] && rm -f "$target"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "[$name] skip $b (a real file already exists at $target)" 
      continue
    fi
    if [ "$MODE" = "copy" ]; then
      cp -f "$f" "$target"
    else
      ln -sf "$f" "$target"
    fi
  done
  echo "[$name] installed $(ls "$SRC"/*.md | wc -l) commands -> $dest ($MODE)"
done

cat <<'NOTE'

  Codex: each role is already a SKILL.md (skills/value-role-*/), so $value-role-*
  works natively after `npx skills add` — no extra wiring needed.
NOTE

echo "Done. Reload / restart your harness for the commands to appear."
