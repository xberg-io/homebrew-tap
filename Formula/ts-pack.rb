# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "0f414a44042384a1f36c7627f4a037d2570221fc5ba03fabb49fee988d0b5bc9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "80928ab7868394f3e39439e7b0cc8bc5f0817b95e499a7c61ac85375afb55d5f"
    sha256 cellar: :any_skip_relocation, sequoia: "ec84172bd18a82e9ee29d83cc28d9c4cc9fbd283e9c3cc80debbc8d67e472811"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0b2dfa1102a98d5a72e283c6cfb044c4a0465fbae691a2c5206f8cf749b9643"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "c0a2ccc6b0c681c8572a3186938a06ff9fb787759f8086c053d038ccd0587d8f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "dd3f668285b42aac7b270eae5862dc01e94d90d35535158d002c7bd00ee538c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "b21e29691cb316cc414ca874e54a9e37c3c24f5e8bd7c0ac0df788bfccb07847"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "de46dc00b428b80548ade5eec4a37f8985c7a12f05320a43f93f9b2c1d5f9a53"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
