# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.59.tar.gz"
  sha256 "f26c4a2d68602c3b40b18d6f3cec1cc66732d423f27e0b623d4afb39b0a44496"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.59"
    sha256 cellar: :any, arm64_linux: "81ee44c85350bdf85797288dd42fd9441ed64a7ab85eebdbfb8850554b31690b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "04ac519d92ad49599e67f4f86484105404c9834bd30584b37c162caf71409685"
    sha256 cellar: :any_skip_relocation, sequoia: "b232e32b683e0dc2f5c66399e9082d6a124343f57da4590c048be87a7f055a4e"
    sha256 cellar: :any, x86_64_linux: "63f18d32728965479a21a0e04ef7985af05b9d68777f1d9474fd3f4a7e420101"
  end

  head 'https://github.com/kreuzberg-dev/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
