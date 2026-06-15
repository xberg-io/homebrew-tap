# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.48"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.48"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8487e7c0b2fe961fe75e21a666a916ed17c337c47f67112e7f02401fd3ea3f7a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d0dfd9f5f3538f6e2e14e65d1c17c2cc6b031c10320c40285ef576fcac8334f"
    sha256 cellar: :any_skip_relocation, sequoia: "cb057437fec7a44364e30f1196aebbf46756aae742f51d3ef2020b48abe44b13"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0d1fa282a2dfa1a0641ea01327040f99185447defd7da03c1982cdceefa93aa3"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "1869f57a3ad30b548eb79172bb3ae8ea3f29f49f7d6c3cd1a463d8629d8f7c85"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "d7d4caa6700ca142d9564a2e9e4f2d446e22774e01c3378a9151ba86b7b2e6db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "404735c1419ca7759a3eb050e1878e1ed3c270c6fc529453fdf62df3c5774cd6"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "56f830b1fdc135588d61e362f096c82f9211a7b10af9109efbe84aa6e58b1e35"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
