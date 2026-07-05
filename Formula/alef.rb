# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.6.tar.gz"
  sha256 "81e8a7b4142fa43113138fff76025ccad57288dd76a0c876c4737c5527b8f398"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.6"
    sha256 cellar: :any, arm64_linux: "10f70953eb50f194bc1ee5a8261b6223c1e621fe0b4f0f5423eb6d06b0aa9a71"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1048b6eca75b1ac8e41b9779e50e604ec7f532abb60989eab09f56b09b12b05d"
    sha256 cellar: :any_skip_relocation, sequoia: "0f6d4a512fbb3f2d45470d7cefc53cf33c5b061ad3dc1ef0dac54f3700884b4c"
    sha256 cellar: :any, x86_64_linux: "e831e2550c1092aae77b9b575c7076c60564d6913b3073745915b71a303a4e8b"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
