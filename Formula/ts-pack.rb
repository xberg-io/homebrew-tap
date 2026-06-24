# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.10.9"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.10.9"
    sha256 cellar: :any_skip_relocation, arm64_linux: "dedbce00df039f830128d44508b4f0b9b49ea1f2913b7945c755e9835ff1536a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4e0ec3eeb6c95f0aa736c74ebf5c023c13c36d1103ec0788b177c8a848fd665d"
    sha256 cellar: :any_skip_relocation, sequoia: "23f7d27ebfa3fa1c800e04df56a7673d5155147b9583681f3b69496666659fe0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4a9cb0b54da233df35c53b10010638e93770658ea29c8feef420323cd6bb2e8"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "8f83029e7d4eb9a0d73ae240cd6bee4bbd9483c26affbb8b444093704a6e657a"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "6a2f437fb4b981a46c7c437e5fb1f9ad3bf2c1f598c1ad9ae08b1ab69a9862b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "7fa5335bc96cdb6f5d5fd56d425c0df15933e2eb0c2e43f7f4bbbaba88b31b1b"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "6d57a961d50c12f113f056347e2224ff03c530972afa564ddcc1adaa03c390ec"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
