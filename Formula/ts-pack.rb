# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 372 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.21.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "2a3d73b379905ba5e6d2c1fc3fd89f360592767dfea9a6b3d8af50eb97bdbd54"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "bb8a512e2dfe6880c1fed79942513b9d55acb90e21ad22a0ac3026fcf60d7f00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5973552715db186cfee48871d4ae7e3d8d2006f01d857da720ac0f0c4ed3a5de"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b743e8fa193e51abe18bd71fc555d1cb7a16e510e720014383a41bc04b5f26e"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
