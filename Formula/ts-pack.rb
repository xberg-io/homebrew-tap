# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.16.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.16.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ce59e5ec1f8cd45b169468e48b3334318d09133b341ad3f0b47ae3e9e3b09562"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "462e3cde4dfc49527a800739a9e4fc13152d266ace4926e3fb9d1083f792b2de"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1807b69c788e26f33db2b533bc5ca02d550f88513f3cb15bad415ba0811d2afb"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "b874629afb7e4fa4ed62f480d51cbd3191d826d90d515e7b11153c3ae610ec1a"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "6f17e75256b8950e6e1b1779aa8ebaf674c34c8723b5f697e5bde1305891ec70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31f82b9c1e63d1b87a7d617b03af1775d1a064740504ea1d49c91fc8b8785365"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb2acf265566e81bf36d368d377ca132f6e25a65cd8a0709ec8c36cf36f42339"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
