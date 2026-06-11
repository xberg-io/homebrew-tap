# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.33"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.33"
    sha256 cellar: :any_skip_relocation, arm64_linux: "99e3ff3f8ddb9c68e3c9db9b53bdfb93465997f2aa497545c41a0ff2363bd5fc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dd766f9eac7657a7cac20484cd6e1665a28452bcf070af9fe4dd5ae58165fdb1"
    sha256 cellar: :any_skip_relocation, sequoia: "9230a5996f250d5d921624579cd5c66b9ca4ed137a21e4cedc2b34c3725b54ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3c137b54ca5a740ceab641bfa5a17ece5a9e94f3d94e4e658e6c8ddf8e8f7e38"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "2fbff942f6923b9464cbb1bcee90d1a239dfdd208553a3b6062d3cf9b201a370"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "fc181c13bee275ee39da35ee9f33b28eb8dbd0a5746cb67169b730a390158c6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "bb612bba53e965880745e8caccfed4377ff333e26985f46f808afdff7d670a9a"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "3e937c17432b08e3022d5d277ce8a14f1595a381028e505eb2fb7493a208b6f3"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
