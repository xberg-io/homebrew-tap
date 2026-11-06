# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.24.1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.24.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6f8c21c76c586edcbbe4871f37f939928de41ff7e059b308839d39b1637e2a55"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8f1771c7d824d01d5674d8831a8039a4e27690cabb9da701c6262bd1d8b4308b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1c5c77fb720b2cdb32b80d25b96ca32f3a942e2b0ae32cdb9657d1d3ebf40675"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "6e9d5cb53325afc7c8a542c25fb4c3d273e3df37fa73c182189724f5b2c429cd"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "1981905a19b06858828c049e7b201096281ef5a2fde74808d37fa224fa39a4e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b72f2a13539e975b28eb00a5363b98a0247c15d7a50dab54b6cf527b6b49d34e"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "842aa1c235748e8fcc80f8038487c657a28d54fced40c2231a5ca40fbbcbba68"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
