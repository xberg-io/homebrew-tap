# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.15.6"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.15.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "0c3b40b095cb39286ab073c68815d80aa40a8aaefdf3c762d9bee7118e2e67a5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7ee2b2431e72ac1e5be5c0317a87cf65fa19af98744e77cba5299341e5eb3c35"
    sha256 cellar: :any_skip_relocation, sequoia: "9909adc3ddf7f5a364c058d44f2093c4509402d2ed092532ecfbfc7e445556df"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ba8ab206ccbd8ba56c5bb2fb4f99584b1559d2b6f1e47a4ee97f970c5451cb19"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "68c039b3b9ce872c474991cf97886f6db77ddff7ad6c6467e0c2fd2b8cc23f4a"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "c5115ab3827356846a1c0c08dac82e0d387a5356e426c36f3ec906475dfc1866"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3135555e513bd814fbb46e704a676a5bf0eec683a84d0795ee72527878c0b57c"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bfb5a4c2e0e7bb442f6cc887b630f27d789d5b8113927ac7d50a770f5208d194"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
