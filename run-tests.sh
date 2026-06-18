#!/usr/bin/env bash
set -euo pipefail

if ! command -v bats &>/dev/null; then
  echo "bats not found. Install with: brew install bats-core (macOS) or see https://bats-core.readthedocs.io"
  exit 1
fi

bats --tap tests/
