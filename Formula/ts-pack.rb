# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 372 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.22.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.22.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "3f49d7fe6fc341c4658e82935c2e851ea159c7fafa9284431388b60c466d1147"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5d9611119fda6dd6706cd83213c3e0141e11db2e3f98b1b316bfa28169d91ef4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bb1c26303ce2b1212da1a3c3085d808a7ccda7e3f03f41c97ca404daf8a996dc"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "fe4a15fca6b9b57ebe3a366d1d697b87e7e9b6934c6a3b82c55e2aa287cf3aa0"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "6c3fc4a8c952080206f76fadc213faebb0f47093bda9b0b23e6ff2d8311ce1a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "237d461f4e8e20a8f5b69cf0ca882a55ecef90d597462f4aae6a78f2de8c7620"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d6819b49130d107b2e6cec2c850164effa8e8d2bb0570b98deef839539aacbc"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
