#!/usr/bin/env bash
# AIKit Free - macOS/Linux Installer
# No GitHub token required. Public repo.

set -euo pipefail

SKILLS_DIR="$HOME/.claude/skills"
TMP_DIR="/tmp/aikit-free-clone"

mkdir -p "$SKILLS_DIR"
echo "  Cloning AIKit Free skills..."
rm -rf "$TMP_DIR"
git clone https://github.com/henkietenki/aikit-free.git "$TMP_DIR" 2>/dev/null

count=0
for d in "$TMP_DIR/skills"/*/; do
    [ -d "$d" ] || continue
    cp -r "$d" "$SKILLS_DIR/$(basename "$d")"
    count=$((count + 1))
done

rm -rf "$TMP_DIR"
echo "  $count skills installed to ~/.claude/skills/"
echo "  Done. Open any project folder and run: claude"
echo "  Upgrade to Pro: https://aikit.originforge.net"
