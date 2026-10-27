---
type: Playbook
title: Formula Maintenance
description: "Homebrew formula upkeep: source-build vs release-asset formulas, release bots own versions and bottle blocks, the on_macos url invariant. Use when editing a formula or a bottle block."
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

**Source-build** (compile from the release source tarball via `cargo install`):

- `alef.rb`, `crawlberg.rb`, `liter-llm.rb`, `xberg.rb`

**Release-asset** (download a pre-built per-platform artifact from the GitHub release):

- `html-to-markdown.rb`, `ts-pack.rb` — CLI binaries
- `libhtml-to-markdown.rb`, `libts-pack.rb` — FFI libraries (`.dylib`/`.so`/`.a` + headers)

### Who writes the formulas

Each source repo's release automation writes its formula and the `bottle do` block (bottles via the
`xberg-io/actions` `homebrew-build-bottles` and `homebrew-merge-bottles` actions) and pushes the commits
straight to `main`. Do not hand-bump a version or bottle hash: the next release overwrites it. Fix the
cause in the source repo or the action instead. Work done here: repair a formula that breaks the tap, and
review the bot commits when `verify-bottles` fails.

`scripts/build-bottles.sh` builds a local bottle for `xberg` only; it is not the release path.

### Invariants

- When a formula ships no Intel macOS artifact (`html-to-markdown.rb`), put its macOS `url` at `on_macos` scope
  with `depends_on arch: :arm64`, never in a lone `on_arm`: Homebrew evaluates every os/arch pair, and one formula
  with no URL makes the whole tap untappable. Formulas with both archs use `on_arm`/`on_intel` pairs. Check with
  `brew readall --os=all --arch=all xberg-io/tap`.
- Bottle URLs: `scripts/verify-bottle-urls.sh` (CI `verify-bottles`, on PRs, pushes and daily).
