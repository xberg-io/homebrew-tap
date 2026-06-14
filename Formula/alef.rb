# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.3.tar.gz"
  sha256 "6a4062f9289892df5b9e63a21711f7f3293ade64e3f71a05111ff7921c2a1cc6"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.1"
    sha256 cellar: :any, arm64_linux: "976a47552ce0f86a92d8745e8410ced6f5d4466945b6b9c87e520e10e4ba6c53"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "050383f5f4e43df17e961c3a744c87d32f3803a465a0d788ec52c655f072cb31"
    sha256 cellar: :any_skip_relocation, sequoia: "e377b47eabe8e133979f34a92789db8cdd0b30dbc5deb48a41da17d38bad8cd7"
    sha256 cellar: :any, x86_64_linux: "e14e7e3ca9a9a81c154f4ae7df9e1c874e1d71686a1802af4d7aed45fbac906a"
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
