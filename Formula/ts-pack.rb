# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.21"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.21"
    sha256 cellar: :any_skip_relocation, arm64_linux: "01eee65be670e85f21b59e39ba47744fa22f38d7aef453a8356bfbf1a8090137"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e7018d41620349b7b7591898bdc5b3e7472162d8407da34b6f18b0c53bc6b87c"
    sha256 cellar: :any_skip_relocation, sequoia: "622d7a3ddd2b387f4d17289bb92bf02fb5f3e729f1377dd0326d4ded98ea43c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "13d248c262c7d82b7b879e8b6a9b383cf54f5e52c0bef7e79f3891312459fdb5"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "a60b883d06b8b983e60d76c9caeb4b586916beaa8d9af49a911146050ea856c7"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "a394b155a1728a5eb484812ba3530f405801de05d6fae367505f2895ab6f3e80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "5850542a654c6779111404778a52ec76e6c37e0b864c9940dff0393be5ac9564"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "8abf26d53ca5cf804c92d32295fb07be67639d428c920f2ac11246b180b30ef4"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
