# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.8.0"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "517ef3d4af110a51369903805c8c31f8de3d19d9faad294508c6209c590b0e6e"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a0d8b1cb9f999781b75e1927b98f26481adec213623eb23599e4a0cea56bd39b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c0a0eab9f92c3d7d682acf98508a01b77b2898428c483d7568044b444c24a6f3"
    sha256 cellar: :any_skip_relocation, sequoia: "a2054e305dc9a51cf2a1227ca21dfbd897e4366112134d58977a012089777fde"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "26f6591831e786b8a86bed5c0d4014b5aeb0fc80c02de1e52d9227ebe5f917c6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
