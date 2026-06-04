# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.18"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.18"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1487c87c9b108181ed690b15e8cc483d8fdaa4e89cb90123d7c9d966edb8a223"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e29d95b60f0c5d0963d22205ab0357f2a5c6d3c3f110ea6679822e643af9cad6"
    sha256 cellar: :any_skip_relocation, sequoia: "0e863f0ab1b88da8c26fa021bd2f20f71f61aa0d494cb239db4f927d27bbfd64"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a7536792dd095425df96842f270ec2b15ebaf9d879214ecd9bd828804eb557ed"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "8f6436d2ec74b55341f7fa854bf22b1074d2f68c26737f7a937c8e7d0cdc0fc5"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "7d42ee2091ea602d957c0dba275365006e07d7204e09f4e72a5946f803a24e44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "e0690b557818891fc612e778c34fc452ab45f751bf19406a0b46ab7cab17e2d3"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "feaee19b64cac764a5ce39afb8a8750e171168739841138774be879866564136"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
