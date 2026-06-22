# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.10.3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.10.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "5640ecf25dd10696911e45625d0017e346805855f28fc28c0b4690f070ff4266"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "82893562ec967e068345dbbcc98d4ab05ff861bd03989c6f2ff0d638f8825458"
    sha256 cellar: :any_skip_relocation, sequoia: "dd35534226836efbda06e17eda9ebe51eafaf37cba3ab6b19f5a68c33a944577"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e8ad895a758c4fa5d07a6f56149d929926e9a156f20f0c097c01dd4ec4112ba2"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "b20c0c507742c901f08122447d8ddacf7d5e6a1d459a0b1e85ae8c39a21d3aa2"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "6101dbe882a9c94ffed6f9f0d32fb95e864f2ee6ac8e8e1aac7f98450752a55f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "2fb083c173fdd377d4831cb0cbc66ab0094003c280a46bf7be5f990804123b47"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "caebfad3963e5860d94c333162fb7075dc894b021e44dbe591d3bee5991a30aa"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
