# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.11"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "73a9eaf0eceeb117450b07747db22df785d359095752c4849bd333c1e2b2f686"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.11"
    sha256 cellar: :any_skip_relocation, arm64_linux: "dd7c4db746a39a1f677f37feb8948efb21c5515bc10a0e23536d5d64b3994cc2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "725873cf11c105c3e645ae7ff7ea8e49a7d1ee962f09207c4d7e965ff34d07a3"
    sha256 cellar: :any_skip_relocation, sequoia: "c59538265735ddad14ac481ec24919001ee18f365810f1c732d24825ac388f03"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "033031d781926082a4001462281830ee6bae4fb244fbdce7344517bab53306b4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
