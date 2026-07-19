# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "54a5c075a08ea9aa0dd87fa239d806204530d5cf63d6266422a2af1d53cfae5d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "305b67226171c2c7b1fcbd7c3c403e963f974c2b5ad08932b8a3248bc76fc7a1"
    sha256 cellar: :any_skip_relocation, sequoia: "844942a720b99be3998ef5dd81be2398632f8abaa74acbca2e99cff182bc847c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4f683bc2acc82aeba53b192aec757a8321e2960bc371fa4522e27e2b2076d14"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "acd57ea569dee9ea4e98441d04974fda49341ba7382c4948c84626c4a1e51169"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "e8333732e5801fbd13548593c04a6c3737ac27bdc15551e1c5fd6b1ed2a6c22c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "3073b1bbda2b831687010a51f43cc807d955d8e308b588854e1494dbb8e4aa19"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "ba2a0ed18d44b92d9de70af5ff76e5828f29fb6a550b24a2933627afecaf1062"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
