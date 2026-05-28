# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.13"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "963cc47378aaff654a4fc26d531e09c2e724f5a08bce19120a8510f971e9b439"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
