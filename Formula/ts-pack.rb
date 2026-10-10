# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 372 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.21.3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.21.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "f963b84ab95b52e45a39a7ae324ca303a3f6b08ce6207e26a9edd0511ef8c8b3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d9f6255fa1d42a3f6ba271db21892c122a8e8ae017e6550341a263d1e095ddd2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "180c5a700cd74ba3c2a29c28162827e67d5a481bb7b6ded7c4a10dd3dad6f3b1"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "aabba5ab2e4cba195f5a1e20a36bed4986b9c8f99a4a14debcda120f3d96b434"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "3234b52317e8ca5a018dbacc2cfb56986c28cded37fe74acace7e8fe9d050c3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e83298d2ae523ef85824e138266b6b5f1f270b35efe3e57db5e53355fca8ccc5"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d433e1a6db08426c6d5eaf43059cd8ebcbd86dc36ad023dc5c5022d91a704455"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
