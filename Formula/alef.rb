# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.24.2.tar.gz"
  sha256 "935b15d6d80f71f2a134857eb4ea29fcb263ef0cfa7eb5959f2ef34e7c11beab"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.24.1"
    sha256 cellar: :any, arm64_linux: "4ea319c5dc4c0733eb908fe9c922e7134a44fc3775d03534d5f12ffe65664de2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1995917478fc0afee64ca85e13e44add81c69be81ccc62ea58a372d8ed9d6415"
    sha256 cellar: :any_skip_relocation, sequoia: "3d870bea405fc4b43d2039f8f6eba6dcdf15a172f69b558deb03f0d720b9bb31"
    sha256 cellar: :any, x86_64_linux: "95f990cc44d2441662dcabe69752c743d692e219cd7055d45fb59af8733008b5"
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
