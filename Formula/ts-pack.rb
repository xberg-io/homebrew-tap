# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.8.0-rc.44"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "cd0bef2136067896478da1c8a3ceef1093d2622e504099060049af1e7a9e3fde"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.44"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8ecd2e809abe311e544a704f157f9aeae717e308e100d1f207fa3d3fad3826b6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3f357ed2c38d44d5f6005ae4f4abf54ec7cea098573fb0f0fed099fdf93e2a90"
    sha256 cellar: :any_skip_relocation, sequoia: "7f5f136316489c541294f8b380dc2ed30cf820a69bd53bbf05fa1f509b14c247"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7f0b9729d5bb627b4d803fbd8956151800bcbb0d891a77a32bc2463888119c91"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
