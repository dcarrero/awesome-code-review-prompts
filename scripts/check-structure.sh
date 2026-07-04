#!/usr/bin/env bash
#
# Structural quality checks for Awesome Code Review Prompts.
# Runs in CI and locally. No external dependencies (bash + coreutils + grep).
#
#   1. Every prompts/**/*.md has an EN/ES twin.
#   2. Every prompt file keeps the author footer and a ```text block.
#   3. Every relative .md link in any doc resolves to an existing file.
#
# Exit code 0 = all good, 1 = at least one problem (details printed).

set -uo pipefail

# Run from the repo root regardless of where the script is called from.
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

fail=0

echo "▶ Checking EN/ES pairing…"
while IFS= read -r f; do
  case "$f" in
    *-ES.md) twin="${f%-ES.md}.md" ;;
    *)       twin="${f%.md}-ES.md" ;;
  esac
  if [ ! -f "$twin" ]; then
    echo "  ✗ missing twin: $f  (expected $twin)"
    fail=1
  fi
done < <(find prompts -name '*.md' | sort)

echo "▶ Checking prompt footer + fenced text block…"
while IFS= read -r f; do
  grep -q '<sub>' "$f"   || { echo "  ✗ missing author footer: $f"; fail=1; }
  grep -q '```text' "$f" || { echo "  ✗ missing fenced text block: $f"; fail=1; }
done < <(find prompts -name '*.md' | sort)

echo "▶ Checking internal .md links resolve…"
while IFS= read -r f; do
  dir="$(dirname "$f")"
  targets="$(grep -oE '\]\([^)]+\)' "$f" | sed -E 's/^\]\(//; s/\)$//')"
  [ -z "$targets" ] && continue
  while IFS= read -r link; do
    [ -z "$link" ] && continue
    case "$link" in
      http*|mailto:*|\#*) continue ;;
    esac
    path="${link%%#*}"          # strip #anchor
    case "$path" in
      *.md) ;;
      *) continue ;;            # only validate .md targets
    esac
    if [ ! -f "$dir/$path" ]; then
      echo "  ✗ broken link in $f  ->  $link"
      fail=1
    fi
  done <<< "$targets"
done < <(find . -name '*.md' -not -path './.git/*' -not -path './node_modules/*' | sort)

echo
if [ "$fail" -ne 0 ]; then
  echo "✗ Structural checks FAILED."
  exit 1
fi
echo "✓ All structural checks passed."
