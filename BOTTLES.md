# Homebrew Bottle Distribution

This document describes how Xberg bottles are built, distributed, and maintained.

## What are Homebrew Bottles?

Homebrew bottles are pre-compiled binaries packaged for specific macOS/Linux platforms. They provide:

- **Fast installation**: ~10 seconds vs. 5-15 minutes compiling from source
- **Reduced build dependencies**: No need for Rust, CMake, or pkg-config on the user's machine
- **Reliable builds**: Consistent binary across installations on the same platform

## Supported Platforms

Pre-built bottles are available for:

- **macOS ARM64** - Apple Silicon Macs on macOS 11 (Big Sur) or later
- **macOS Intel** - Intel Macs on macOS 11 (Big Sur) or later
- **Linux x86_64 and ARM64** - Standard 64-bit Linux systems

### The macOS floor

Each formula has one macOS bottle per architecture: `arm64_big_sur` for Apple Silicon and `big_sur` for Intel.
Homebrew installs a bottle on the macOS it is tagged for and on every newer macOS, so these two bottles cover
macOS 11 and later.

The bottles are built on the `macos-26` runner with a deployment target of 11.0. Homebrew removes
`MACOSX_DEPLOYMENT_TARGET` from the build environment, so each formula that compiles from source sets
`ENV["MACOSX_DEPLOYMENT_TARGET"] = "11.0"` at the start of `install`. The CI bottle step then retags the bottle from
the host tag (for example `arm64_tahoe`) to the floor tag. Before the retag, it checks that no Mach-O file in the bottle
needs a macOS newer than 11.0, and fails the build if one does.

## How Bottles are Built

### Local Bottle Creation

To build a bottle for your current platform:

```bash
cd homebrew-tap
./scripts/build-bottles.sh
```

This script:

1. Installs xberg with `--build-bottle` flag (optimized for binary distribution)
2. Runs `brew bottle` to generate the bottle file (.tar.gz)
3. Outputs the SHA256 hash needed for the formula

### CI/CD Bottle Creation

Bottles should be built in CI for each target platform:

1. **Linux x86_64 and ARM64**: Build on Ubuntu (GitHub Actions or similar)
2. **macOS ARM64**: Build on GitHub Actions' `macos-26` runner, published as `arm64_big_sur`
3. **macOS Intel**: Build on GitHub Actions' `macos-26-intel` runner, published as `big_sur`

Each build should:

```bash
brew install --build-bottle xberg
brew bottle xberg
```

The resulting `.tar.gz` file and the output from `brew bottle` will provide the SHA256 hash.

## Updating the Formula

When bottles are ready for release:

1. **Get SHA256 hashes** from `brew bottle` output for each platform
2. **Update `Formula/xberg.rb`**:

   ```ruby
   bottle do
     root_url "https://github.com/xberg-io/xberg/releases/download/vX.Y.Z"
     sha256 cellar: :any_skip_relocation, arm64_big_sur: "actual_hash_here"
     sha256 cellar: :any_skip_relocation, big_sur: "actual_hash_here"
     sha256 cellar: :any_skip_relocation, arm64_linux: "actual_hash_here"
     sha256 cellar: :any_skip_relocation, x86_64_linux: "actual_hash_here"
   end
   ```

3. **Update `root_url`** to point to the release version
4. **Upload bottles** to GitHub Releases under the corresponding version tag
5. **Test locally**: `brew install xberg` should use the bottle, not build from source

## Release Checklist

When releasing a new version with bottles:

- [ ] Build bottles for all 4 platforms (two macOS, two Linux)
- [ ] Verify bottle SHA256 hashes
- [ ] Upload `.tar.gz` files to GitHub Releases
- [ ] Update `Formula/xberg.rb` with new version, SHA256, and bottle hashes
- [ ] Update `root_url` in bottle block to new release tag
- [ ] Test installation: `brew install xberg` (should use bottle)
- [ ] Verify no build dependencies required: `brew deps xberg` (should be empty)
- [ ] Commit and push changes to homebrew-tap repository

## Troubleshooting

### Installation uses source build instead of bottle

1. Check that the macOS version is 11 or later, or that the Linux platform is supported
2. Verify SHA256 hashes in formula are correct
3. Confirm bottles exist at the `root_url` with correct filenames
4. Run `brew tap --repair xberg-io/tap` to refresh tap cache

### Bottle is missing a platform

Add placeholders to the formula and schedule a CI build for that platform:

```ruby
sha256 cellar: :any_skip_relocation, big_sur: "will_update_after_build"
```

Then update with real hash after the build completes.

### Need to rebuild bottles

- Increment patch version if fixing a bug
- Or use a release candidate tag (e.g., `v4.0.0-rc.19`)
- Rebuild bottles and upload to new release
- Update formula with new version and hashes

## File Structure

```text
homebrew-tap/
├── Formula/
│   └── xberg.rb          # Main formula with bottle block
├── scripts/
│   └── build-bottles.sh      # Local bottle build script
├── README.md                 # Installation instructions
├── BOTTLES.md                # This file
└── LICENSE
```

## References

- [Homebrew Bottle Documentation](https://docs.brew.sh/Bottles)
- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Xberg GitHub Releases](https://github.com/xberg-io/xberg/releases)
