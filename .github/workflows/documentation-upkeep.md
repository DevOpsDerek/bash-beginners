---
on:
  workflow_dispatch:
permissions:
  contents: read
  pull-requests: read
inlined-imports: true
imports:
  - DevOpsDerek/workflows/.github/workflows/shared/agentic/documentation-upkeep.md@dac4b81c298cb3ea6821ea312efa5375f42d5ccb
tools:
  github:
    toolsets: [repos, pull_requests]
---

Follow the imported documentation-upkeep instructions. Use only the
repository's documented documentation checks and report the commands and
results. This repository has no dedicated documentation-check command; do not
run lesson scripts or modify exercise/content files.
