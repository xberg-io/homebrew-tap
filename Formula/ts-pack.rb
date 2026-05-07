# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.6.2.tar.gz'
  sha256 "b6edcd227c774dc9782c60a6fc04cb501d5c90126321cfd0b3b5bd3e3ce2fd2c"
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.34"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ab00b6d6d0ca639736c88b35ba0316b6bf7b6af4931b473dd884602c621f5927"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "06e33a642e8a1f3b1689d0dbcb9c75f80ade375a587c91a5b50da797eb323c59"
    sha256 cellar: :any_skip_relocation, sequoia: "9203efb64576c8c6a68742cb0c29b355d7c34261625869d5b92f7ace3d12cd40"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1d95e676e7af363504082ab59b672a29996cbaae8c218f055b00761705bb590a"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
