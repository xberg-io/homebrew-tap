# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.50"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.50"
    sha256 cellar: :any_skip_relocation, arm64_linux: "cc0bc96ca3139dec7752fb55faba942ce0971596fe223e7680f87e30c9cb854e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4b79d0ee32955a166e742e88490cecf8e774b8cad09beebac3ad86d8de9931d7"
    sha256 cellar: :any_skip_relocation, sequoia: "dd0f2f8c6f3bbc9a3566afd55a3dfbe038c62831e21120c8f1cb0bc0286609a2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b630539c2c20f0195e3574ab327068d762a2869694efd198d9643125c5661e2f"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "7f7ac2132ba2899268ebf1c5b8e14ff5cff1add49f5de83c3f710c07214bbc0e"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "69f60d392f44af2f98294cc07ea16cfb8612987b9ff2afe8bea0f4b55d7f5035"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "6cba83a916a680951a38d5b5a39f17af7ca7d75ed24aed9da4ab23d1321f6e7d"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "36ec73057a62d97f2f5adccc7ed71276320c6fc5b303a0a7a1fe432d156433aa"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
