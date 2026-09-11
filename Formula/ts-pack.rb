# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.18.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.18.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1bafc69e565154361f30fe4fed299630428e16564d77dd707134585aacf31fa5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "48d12fb30a41de391081d6876de15c4933018e1001bad5f8facbd5971d3b9a88"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "48f88ab2c95e60faac4164dcc27511df0ba9cf1dcd27dee83d188cf786ec364c"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "ef6bc53c4b24e2148c1f94e1d88860f0ce4ca50157dc050a2aee39690d363e25"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "7e60379d5ce0220557ecabe0c6283590c4378cccfcc58b5e874543f1e3ee064a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "00893a47f0220a9fb7649b63ff9e45f3e11e65baf8abce9b75d6e5ba3dbfc13d"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f60491739f2600ad165342c84de2933102c165cf6d5ea2f3df08786b1dc6194"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
