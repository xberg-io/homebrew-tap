# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.10.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.10.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6c9738b26d52d74f6338eb879279a242d4f16f25f295084eab1102ba7099f027"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2e4b17ec58ce999b17a370623625205642ae6005cf8b6e49d8ad9a976e601f7b"
    sha256 cellar: :any_skip_relocation, sequoia: "b31836f9224b508a02fb1c60883635f51ed6b9a1a9752a282cc667a29591b771"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "81af9626a478ca8ba2209d71ac87b9354d83f1fe2676a218eacf012b5fd661a0"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "861dee842f09d572b1877beed9ccfc854a1de57a06e67bf57a680533490f9d07"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "2ee5d32814e1d8dd76544aa7e560fcf23044feb1f264068e196bf2107f7cbdb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "54960511a9a3580ef0d9d333586cbbb3d62b741b5be886238488110825ea10b0"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "83382b8c083158531775caf226977d529f21dd43b10e9bbe6cdaedb1a4680193"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
