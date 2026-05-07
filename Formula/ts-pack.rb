# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.8.0-rc.35.tar.gz"
  sha256 "be924354f73a12359ae806ffabb028a1d9b02da4729b9ce1fd10b20d01d8cf65"
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.35"
    sha256 cellar: :any_skip_relocation, arm64_linux: "364fd3bdbac92a0968a3ed8f8576f5e8ff2c16ba3b875564d9aedbcaf69db28d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "480c2792032d5cf7b879b00a85f7f451a99b8176d06041407e99443b3ee36de5"
    sha256 cellar: :any_skip_relocation, sequoia: "56134864b7039d811a011ca6ff8a4e6f9115fe0d41bdb04bff4f3cb6e3426005"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "16cfa49fba91e48c16a7b08e5d6c3c9f1d8864ba9b186a4978f8e9f259f86b98"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
