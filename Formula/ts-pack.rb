# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.23"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.23"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a33f45181cb7f649bc07760b65cdb79484a7ab98c0b899c7667a8b23d95d028b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a362c8cdefd6c9dece572173bf84da02021546c44ee043340538ed99a415fa23"
    sha256 cellar: :any_skip_relocation, sequoia: "3dae784f613d2b4e84d5581bf72f53a0b90028a976a06122a63a8b8a8cfa13da"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "85a247b426f23ef0b648f812182af78fb91d509798dce62eee97ea5ee41e4d5a"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "3cd6c2c8ef5f6d633012a8613bdfe65e2a9f9e635198e10d9961072fef636faa"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "08e05719a771ebcd0b67868e509a0a5993161a2af1ffb972670d858498acd787"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "b49b1d7153d7cda5021e18f3320538e0076c6b729f17c79d633762810390c36d"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "533100eb69c597559fab7e8437bf881f141910b2518302cb4b3f98eb4d911b94"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
