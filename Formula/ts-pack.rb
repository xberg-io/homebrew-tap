# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.49"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.49"
    sha256 cellar: :any_skip_relocation, arm64_linux: "dc20e46429903405ddcf99cc4bb94ae031e80ef2e84bfed2a69623c191fa069b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e848ffcf72dd26e2cf76e138258d9c3cf9c61756dba36943f44edcbc86521338"
    sha256 cellar: :any_skip_relocation, sequoia: "7ac7518fd5d78811df2ca10d6b065473873b4a6b67e24899109c65fcb72f07ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3a9a7addf15a156b27f70b5d01df748dcc0d4eabd519f96d60f1a7082e5c25c4"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "7701c5d839713e73bd9ecd7312a531cfa6b5a8265981f320af89e2ffaa558677"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "f7849973243e243eaf0fdb3ed6cbd0ecc8d031ad78a3dc085c383dc9258e49aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "d11ca971b3722076bc23e7cf5fc2731b8229dacdc86b64b55562050f69e8135c"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "cd07445d82ae15fec35a931327a93b4f609e666a1b8628d6156929444c812656"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
