# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.6.2.tar.gz'
  sha256 "a75056290b4b3c9a4548eca0c69658f15a14a54da9833e12f6eeadfa68fa854e"
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.33"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c9eaa870920b1ba5a2602c4ca39d38c1a617eed39f8c191c0c33e55a8581458b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "addd50b554eb5ca7cd7386dcdf62ada8cf9ecee9c3ce2ac34b7e4d251b09aa35"
    sha256 cellar: :any_skip_relocation, sequoia: "b5d9e8a0d01724f1ea3ac806e0073e4808e5cc5d69cdc77810bf1cde40c8cdb3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9a426bd03570e5b1c2ce8773468bcbb71371ef083cd264154d2a22c86ee96e31"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
