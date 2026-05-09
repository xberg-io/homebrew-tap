# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.8.0-rc.43"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "58d6c953340c817c30f069f08084eccdb19bdd36d39ada5565c08ab4356ee008"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.43"
    sha256 cellar: :any_skip_relocation, arm64_linux: "3a69d68693533885ba05c44074c59f1f2e1b016da623f7bfc863021120bc7072"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a49aad6a6957b282a24669d7147321cd21bb061abb99d7713c5e6c58dce5269c"
    sha256 cellar: :any_skip_relocation, sequoia: "076c95303c5eed9966aaeeacd588713db8825c68a656924ac50b584bb186b83b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "27c920c2d5fb868288dc6482fcdc5b4ea93e59b2dfad9917b968b373a0635bb8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
