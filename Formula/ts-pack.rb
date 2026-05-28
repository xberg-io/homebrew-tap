# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.14"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.14"
    sha256 cellar: :any_skip_relocation, arm64_linux: "37d92cd23bc8f9d208b0deac7b331ec543e2473d674b2ce4e4dc96e2cc06e6de"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e0c3b107539e811d938816e71ef8bb27f67d2ffbd199c5ba37dfca71b53aed93"
    sha256 cellar: :any_skip_relocation, sequoia: "78c49d889fbb01d1c0b8d1e5e5bdbbf1b93efcc29fe8008c56facea665a17785"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "23a5a1cb231afabe59cf984ed631fb7105b5ec9a9f1778b24338a87091bd9d4a"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "4940cf6b9f116a8aff57e3ffdb128a272ef3ab58975ffa8b97180db0e61cf062"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "7989754075e1d79e6f7035eb840099f35609e28a3f58a054bdcc6dc3f7f25fe0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "d36c640c931850f7ae3aad252c2ae9559911c7e32a8d04fc20b9eb7948896d3a"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "cd08c3c1e7354cb383b3cd770dccefd455f35ff59856003d4f5d7e49240ea08a"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
