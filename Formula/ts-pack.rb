# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.10.1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.10.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "b9c9c428c7a7a8c96637c56a6fc9d1e65670619e18ab3f7b64a41803ccb7113a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "09377ccd65d4f5b35c8bece8178ed7d9ada438c5432435216d10c0bf1dfa62d9"
    sha256 cellar: :any_skip_relocation, sequoia: "b7ad1b4126ab343cbbc008af47654882c74b243f5043bb3152fc879c36fd4300"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a49d7335c983695b1afcb1f7c2127bb060b2683b1b6015c05147c8d280104434"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "34969765e7d4b7d985cb54431ec85763c725193f1417c111d9de807faa39593f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "1a80d673dd35332f2a9f091128200ba1d6cd5a00952699809c8c0c07e6fb0e63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "d35a2795f489acfa18e4f41d345a8726139a7c6fbebc1102e1da017736e8c429"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "85354b4d17894ffc30d409089e73f3cf1b72c18ddc9c70ec0fe79daebfd4f9a2"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
