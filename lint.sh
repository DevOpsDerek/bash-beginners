#!/usr/bin/env bash
set -euo pipefail

if ! command -v shellcheck &>/dev/null; then
  echo "shellcheck not found. Install with: brew install shellcheck (macOS) or apt install shellcheck (Linux)"
  exit 1
fi

echo "Running shellcheck on lessons/..."
shellcheck lessons/*.sh
echo "Running shellcheck on tests/..."
shellcheck --shell=bash tests/*.bats
echo "All files passed shellcheck."
