# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 372 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.21.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "b22d6aa4640f9fe0e9efa472c47aab8c88609e8836f94080ee565d76c8a101b3"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "9c43ea553fdaf5a45ef3292e39ecfc58daf5500fdf33d043497dba3a4cf102ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d46a8661851dc8851e638d1a8da5495160df1b9a8a7624381672a4e7e0efd3b"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b46f9a3dd5d28a4ef1538a16342da56a3c530d7f030881a71f1de07b4ebd5277"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
