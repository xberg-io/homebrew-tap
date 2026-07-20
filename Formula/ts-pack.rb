# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "cd8e7573fe408e05d1dfde830e51c5dc9984b1e9ea2ff5c705673f0141500a65"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "86002628dafa863e08560f32dbc257baf9da5adce0f4556982453c347672a400"
    sha256 cellar: :any_skip_relocation, sequoia: "f3de2c22d55f0595b9a451bb0785abec59b8efbce8d7167931db023cc04a40fc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e1872f3dcbe516b39e2edf88da22e3ca85ed36d0e98616bde9932ae547de4d99"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "7e578dc6d1ba6aa0301a62010427aa8496b6f688c42f4e32314b015f609b32c8"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "138d6900a9a45876e36a129bdcfebda7c460125a5ced32a5471f591c5f82889f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "6efb5b24ccd23d7efb4721d7544ae0706770136a30ccb01b054efe5ec19b5c6f"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "0ec353c5ac6d7f59541d42546b89220c835212cbfd9c8ea18f3e6e7fc62f6f2d"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
