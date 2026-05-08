# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "234e7ce1723e4ae1328bcb48b6770bfe2c5b336a78e5d0c2caaa69229132735d"
  license any_of: ["MIT", "Apache-2.0"]
  version "1.8.0-rc.41"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
