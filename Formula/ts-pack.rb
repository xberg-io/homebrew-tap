# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.15.10"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.15.10"
    sha256 cellar: :any_skip_relocation, arm64_linux: "77b43a34372b0740187ae7dc39f03c5a8baf613d43b3a3f82fbddee912d307a9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5ea0aa25e8ac17aa57ed71422e68c874f1a937e726fd93ae50797b8b9bd0fabc"
    sha256 cellar: :any_skip_relocation, sequoia: "be3ced3980fb39ef7bb402d3bf8d13511e195c5ceeca24ce5c18f848eaa04ac8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "083482ceded254f965fa032ff7ce44c66c199ccf996fc107f15224a3c9afc8e5"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "f0bfdd6501290ad1388fef006f8a801d87ba19dccc53a123231522fa3e0c66c2"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "06f4bd2e0be8d7ae833f25441b3611b07248df3283629dbfbe26d0eaa088ef4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a20ae3e9ed62ebc02fda90fefeb23de1e7285e873dfd9476f416e20e1a8b8188"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85e1effee2248bc4084796aa581bf659b76124b659dd82db277ebf3adf5e4f65"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
