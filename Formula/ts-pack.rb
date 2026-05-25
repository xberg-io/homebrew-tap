# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.5"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "42085de58b5adeeedb18d92a9fc2242d15df26bc9fdb9115f8d69c1996f967f8"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "29bbc2b5c1a88292fb14089d8340bce89df07eb2cf761ec64494212658749bb0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "00409569580ac883e1226779afa82617920fb935e85a351f673f10d0f32cd9d8"
    sha256 cellar: :any_skip_relocation, sequoia: "2f57b8d9d7fc6e0d47662aacdfb55d1d8a4e06836387051158d23dbc931f3d4e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4730024f0b014ce3b7900aba2cd8fb0a803eda78a1a84134d8509c5ac29cd0e8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
