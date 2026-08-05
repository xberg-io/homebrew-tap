# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.14.3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.14.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "b18796e75093f1c2fe913df55e40332b8b74bbe8722c148c4e6e24ba7a434e99"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f393364acb66860ef165bf6bd39eca9e43ebf5970f6b9a022b02929edf126fcd"
    sha256 cellar: :any_skip_relocation, sequoia: "6b7e1341e1d6df68d3031ef027b5db1ff709e3f23065e92aede01d65cc2a04d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9c54bedf098d85f2c046d7cb9a37b5cfcd43d89dbcf3d3548a153cffb4cd821e"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "7650c15e48c3c2bf77b5e924dd368f6df05adee13873cd56684d4339893b10f4"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "919d050ef4e4f7a3d185249d12b1266d5f61d315b39c21a7cb4f293ae0afc182"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff644bb49ddd56eb95da5f98bfdb7ea3864ccb664ee305e21d37cbe5acafff7e"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ed6ebb1910cd182086cdb7a91d26639ca86f9ac711e0928ac37afa4c9ad1826"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
