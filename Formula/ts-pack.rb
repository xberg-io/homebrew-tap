# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.27.4"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.27.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "4c3b6b7fdf096e0a688f43386d5d189684e860e392293d248bac3a1e6a7d7ae6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cca7ecc72a9b81f0a1da28401d119b73313bda83e91e654ab46c26e304edeb20"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dcfe18fddfe54dfff8d6b58c0be8a39260c0957545b1cea82f78e7bb5507ea2a"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "c67301a79d2b9f8b5b7d9bc2046ca8eb5b84bd803760255bf58916d18d71a455"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "f6a1aa1f546d2a39b9bddd1f58e4df15299f13975e156e0d825686171615260e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce7c96e80f87a9a129dfedd7e17c31284d71f6cac61add2ac2dc33f59597a449"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3cf7989471c22921879331d2cd0345672cff85f9cfa26bac27b523edb335a697"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
