# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.53"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.53"
    sha256 cellar: :any_skip_relocation, arm64_linux: "88e598c44d4f04169171b4eb269fac4dd591ba7f1ec2241393193ccfc11521ee"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "23f88dc578d9d2681db3d2cff18c5f5b9bb8d96476d69e54204849ce4f2a015c"
    sha256 cellar: :any_skip_relocation, sequoia: "70188c370b3f04369a87020461bb6bf6749e87ed395fe3481c7cde03fe3e46ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f0290ee8d3f8997c0d3037035543b3b89008c258b273102bf443027ba0380adc"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "4ab25dd9f77fe2403deff2d495365980dcd7b8cb0dda526050b0c4bdff10b70d"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "010820949074d3e150b6d5e4f7ec7a690195102813a54834886077d079d57c52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "43202d3749a91ceafd01d2d2c5fe1fda8b51ae6228b906e91bdb8d55f7e7c31c"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "474ed40335ffd04d65b2da9dd99ac13000bae5b47bb8989ddb2d0b73620265af"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
