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
    sha256 cellar: :any_skip_relocation, arm64_linux: "e260347f9a0a37e40d86ef3eca655c1dd194eef02b65ca62840d1e5c81917f4a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0d5637f75c4c40776a0e429494bec1115e4e5b69511db3f04d9e8bc5957f4adc"
    sha256 cellar: :any_skip_relocation, sequoia: "f01efd271aa7ead4a3c082ae9dbad9d5c6c32a0aa4280fa41f76c956ba095c98"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "acb3ce03738d4bc0788af0699ce176cccc684372571d2ff1ecddc007edfb5f2c"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
