# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.25.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.25.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "bbd04b398c38c32ae0cfbf63104f8cc685fc058bfa7365ba06073ced8e355ae8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "73735786bbb2da96f65ac52cc0feb5f04885ca9e3763a0907fdc8261b63c63eb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d1c4b7905c16a70a258cddbb9e3b042c4a579d9ade4a25e50b8f306653f20ead"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "09a09565eaaa0931863c0c5a2582af54d0ca863f1f6754bb34fee283ec9ca43e"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "e68033b9f471e48fcfbfa3d8a8d05522268ae9ea03ab44c1e52a50d32b4b631e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d5b9f283be87813fabceeee7e18cfedff400331d9a004eb5320e2d0996432dc"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5bfeb640d6fb6d8798017acd0dba71bac5dca676aa80ff2ebb6e6db62fa93a09"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
