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

- macOS ARM64, macOS 11 (Big Sur) and later
- macOS Intel, macOS 11 (Big Sur) and later
- Linux x86_64 and ARM64

Each formula has one macOS bottle per architecture, tagged `big_sur`. The bottles are built on macOS 26 with a
deployment target of 11.0, and Homebrew uses a bottle on every macOS from its tag up. See [BOTTLES.md](BOTTLES.md).

## Uninstall

```bash
brew uninstall xberg
brew untap xberg-io/tap
```
