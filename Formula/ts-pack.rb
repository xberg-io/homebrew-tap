# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.4"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "34feb3a92fe5b0a49614cc835380acc99fe8f65b3a81955c59876dfb61933110"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3c84217f85bdb7d3674cb4d5d876895fc7ea03c14aedf0ea18a97b99b4e92e53"
    sha256 cellar: :any_skip_relocation, sequoia: "3b7c05fdf48206541ebc5a8b9a4a476460acb000bb759063f81f69d98b2c2526"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6b56c726a05159446725eda3ae5865abe4ce5831afa6b62b40d07b57a3abc7c7"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "aee9ee98683dac4e5cc309a8f8c54d63c93d448a234b4f3bab19edeea4e0521e"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "e5be8ea198651df1b709b750716c4304d023806f0f535bd8c1964d2a39112e5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "7ee8b113ca23a268c680377d37072cd7be196716b564bdb54a4a4e111e5b5f27"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "216dce1607f6f09a9068eef24653d2e2fd37eae3f9d64ea8c9ea4b804a4b0308"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
