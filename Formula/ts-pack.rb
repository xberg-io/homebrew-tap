# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.8.1"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "43182ca0151a19912b0e70b22abb2ba2229d60cce023206f6a0ac5b4708cdeb6"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "33da13697f1fab276ec370e73a6473ba0bce95011b30f9ccd6b908d9fe88f1cd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "98fa276bb7ec378c862b0c3a99e083c3cfd804da32b689eab2235bb4d35ed9e9"
    sha256 cellar: :any_skip_relocation, sequoia: "38c7c58722d544d0c417707c00c763b5d825e44ebf727583d341be72104179e7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "08416f063348ff40e27d9351b5fc579a9a5959aa73bedfdfd954cd01a609189b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
