# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 372 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.23.1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.23.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9a90574e2f4a122cef25f6337113a26af81c3ca96209cd1b7c80802ea4368614"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0a0ae7c7fd58cb00383de7c499aa07eee604160c0ef2741d3e49fa2a2d3a2dae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "32054ed3a2d891b8fd0cbe256eab81f07869fafb27452e009de7d0e627a0d19e"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "29c33b574b32590fba3674ed985227112b4066ec540bd4959398896355e67588"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "707720a9d44af7746aa321a9ddc3de4f9b3e31936759f58f459276172f1a0da2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0659921361121b38d7c75fbdb125173121efb9ea93bed868237f15b2b6ddae9e"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44fd9c38caf4a16862ae02d96208e384d297752171746ce644b5c2b3a66eb0f2"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
