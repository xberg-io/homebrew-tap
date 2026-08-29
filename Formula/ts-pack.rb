# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.15.12"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.15.12"
    sha256 cellar: :any_skip_relocation, arm64_linux: "14d352676c2b86cffc250861d245c31c9b06bac89638bb47e85836434d05054b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9318866951aaf385b7e159315b5f7184183318f1dc9be04725a641bcd340b653"
    sha256 cellar: :any_skip_relocation, sequoia: "652afbdaa28bf2999f70ae8acec4f5a9c056f47d53c5106d512970fe1c93636c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f6c830c55f7b6aa3d08d38f438a6244d2aac505ed3b9e2a3115dcad014b3b2d2"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "39ca8d54a8c37b87b4ff6932621df98a1414ad059531b56ff38a4729344a34b8"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "1418c3b6408cd515d078d07eccaed415edf98d0859eb3b51e2565d041d8d5b76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5b02ff3111d24399ba8c9ad4cada66058cb01bedb93665ede181f0e6dd8c478"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e6e0aec931df4d12e10ddea9fdde17715ab63f2ce9272f0f22b267fa501c62d"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
