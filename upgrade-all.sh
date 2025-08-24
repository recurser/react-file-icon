#!/usr/bin/env bash
set -euo pipefail

# Requires: jq, yarn, git
# Usage: save as upgrade-all-and-commit.sh, then:
#   chmod +x upgrade-all-and-commit.sh
#   ./upgrade-all-and-commit.sh

upgrade_and_commit () {
  local pkg="$1"
  local flag="${2:-}"   # "" for deps, "-D" for devDeps

  echo "Upgrading $pkg ..."
  yarn add $flag "$pkg@latest" >/dev/null

  # Extract the new version from package.json (handles deps or devDeps)
  local ver
  ver="$(jq -r --arg p "$pkg" '.dependencies[$p] // .devDependencies[$p] // empty' package.json)"
  # Strip leading ^ or ~ for a clean commit message
  local clean_ver
  clean_ver="$(printf "%s" "$ver" | sed 's/^[\^~]//')"

  # Only commit if something actually changed
  if ! git diff --quiet -- package.json yarn.lock; then
    git add package.json yarn.lock
    git commit -m "chore: bump ${pkg} to ${clean_ver:-latest}"
  else
    echo "No changes for $pkg; skipping commit."
  fi
}

# Normal dependencies
if jq -e '.dependencies // empty' package.json >/dev/null; then
  for pkg in $(jq -r '.dependencies | keys[]' package.json); do
    upgrade_and_commit "$pkg"
  done
fi

# Dev dependencies
if jq -e '.devDependencies // empty' package.json >/dev/null; then
  for pkg in $(jq -r '.devDependencies | keys[]' package.json); do
    upgrade_and_commit "$pkg" "-D"
  done
fi

echo "All done ✅"
