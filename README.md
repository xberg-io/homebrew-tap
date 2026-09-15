# xberg-io/homebrew-tap

Homebrew tap for Xberg packages.

## Installation

```bash
brew install xberg-io/tap/xberg
```

Homebrew 7.0 will not load a formula from a third-party tap it has not been told to trust.
Naming the formula in full, as above, is enough — Homebrew treats that as explicit consent for
that one install. If you would rather tap first and then install by bare name, trust the tap
before tapping it, because `brew tap` itself runs a verify pass that fails on an untrusted tap
and reports it as the unrelated-sounding `Cannot tap xberg-io/tap: invalid syntax in tap!`:

```bash
brew trust --tap xberg-io/tap
brew tap xberg-io/tap
brew install xberg
```

## Installation Speed

Xberg uses pre-built bottles for faster installation:

- With bottles: ~10 seconds
- Building from source: ~5-15 minutes

Bottles are automatically used when available for your platform. The formula falls back to building from source if your platform doesn't have a pre-built bottle.

### Supported Platforms

Pre-built bottles are available for:

- macOS ARM64 (Sequoia)
- macOS ARM64 (Sonoma)
- macOS Intel (Ventura and later)
- Linux x86_64

## Uninstall

```bash
brew uninstall xberg
brew untap xberg-io/tap
```
