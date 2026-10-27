---
type: Playbook
title: Formula Maintenance
description: "Homebrew formula upkeep: source-build vs binary-only formulas, the version-bump checklist (url, sha256, bottles, root_url), building bottles. Use when editing a formula, bumping a release or updating bottle hashes."
paths:
  - "Formula/**"
  - "scripts/build-bottles.sh"
x-ai-rulez:
  kind: skill
  id: formula-maintenance
  metadata:
    name: formula-maintenance
---

## Formula Maintenance

### Formula Types

**Source-build** (Rust/CMake, compile on install):

- `xberg.rb`, `alef.rb`, `crawlberg.rb` — build from tarball via `cargo install`

**Binary-only** (pre-built platform-specific artifacts):

- `xberg-ffi.rb`, `libhtml-to-markdown.rb` — install pre-compiled `.dylib`/`.so`/`.a` + headers

### Version Bump Checklist

1. Update `url` and `version` fields
2. Update `sha256` for source tarball or per-platform binary tarballs
3. For bottles: run `scripts/build-bottles.sh`, update bottle `sha256` values from output
4. Verify `root_url` points to correct GitHub release tag

### `scripts/build-bottles.sh`

- Canonical script for building bottles on current platform
- Runs `brew install --build-bottle` then `brew bottle`
- Must be run on each target platform separately
- Output includes sha256 hashes to paste into formula's `bottle do` block
