# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 372 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.22.1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.22.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2fcc2c0e8b665ea5e9edad331bd496e7b4af05634f954346e6350896fb59561d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3aec1d45d2af9cae34b8f6fd58bd3ef5aaeee69cef9556c0f9449604b8a5a5e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7ea1e558948eebd4b647ae5fc0c404f721b5c9da386869c7a887249f61cec80a"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "b204c335f06924faa22048a3b1d24ed2bbb8b4a55ebb78bbbfe39b2b781de211"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "f14c4fc91b15c172621162d021888767651f39d4ebee0c890c6cb2b133be405e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d954a1a9989009a1cd4a5f345309faff7802fc164af66f45eb92fe619a0b4bf3"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c7a16f9546b6ebe8b109571d8bd9e61455ceaebca538181d085bcc42e149642"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
