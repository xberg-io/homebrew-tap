# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.2"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "10b4296a32b3049da5d57945daf18929253e4571e6ed7f16d2c1a3ee7f06b116"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "f7131a94745a9e0f98052d843c2439ffae500caf37e1deff178104efc9db966d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "625640b5d8569898a48c356894a1c5083aebc18e2a1025f99a3da5dd446f196e"
    sha256 cellar: :any_skip_relocation, sequoia: "9eca557dfb3c1cb360e9eefe7699a0b2bccc3e7552848945999b1d97934c179b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ecc72a32f6e5ac996c197bfbe9e21ef338774fcda105402ff4557cc5b654794"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
