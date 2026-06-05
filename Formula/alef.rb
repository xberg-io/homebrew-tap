# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.13.tar.gz"
  sha256 "c23e3da20a8bb877e56d3b6f77adef8a2e16ad84b188e937fa6573d54c821460"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.12"
    sha256 cellar: :any, arm64_linux: "4e16e49c1c52e0d3683b6d0ec77e383abb0af2d124c74f734c53f3e57b1aa1d4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5bf868349bdb76f9e53172471b531d6091b1293b02958972a93880d76dbd2c30"
    sha256 cellar: :any_skip_relocation, sequoia: "8340a3635dac6fc6b14b421edc8b39dbcf709797bb8270e8fd1f20e45ade2fb0"
    sha256 cellar: :any, x86_64_linux: "c9b64e2857c431f029e1c57b0ee4d6a50635122f7e16560d8edb0acfa70e5c6e"
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
