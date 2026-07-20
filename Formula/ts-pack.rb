# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8e5b411437ad008308f8b0a285a94cc8825251c1c6c8be5c701d2aefbed9f618"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "85742d2c0d469866b3b68fc9bd26be19d885e42c1a1502f7af9f7cf4793d319c"
    sha256 cellar: :any_skip_relocation, sequoia: "5b6c021797b12ee99d1444e2a64b0c43d3e26c06dec3de53f854c968990616df"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7091580da464a1ccc4ac30a9f31c88d2b7a5a096c12f4032be991ce107c9e201"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "7e578dc6d1ba6aa0301a62010427aa8496b6f688c42f4e32314b015f609b32c8"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "138d6900a9a45876e36a129bdcfebda7c460125a5ced32a5471f591c5f82889f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "6efb5b24ccd23d7efb4721d7544ae0706770136a30ccb01b054efe5ec19b5c6f"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "0ec353c5ac6d7f59541d42546b89220c835212cbfd9c8ea18f3e6e7fc62f6f2d"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
