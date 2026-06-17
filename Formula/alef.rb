# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.28.tar.gz"
  sha256 "4ea65827ab84cee5c4163a2d2c8b596df08c5b242f52d0d18f55fac07df5c79a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.28"
    sha256 cellar: :any, arm64_linux: "001c71f06da1610c95a83e88e951dddea858609d2b33447d663793bb4e5c503a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8b43170993da671beecd0528f179a94a3898a5e7090f78c2a7fc9e374fe7934d"
    sha256 cellar: :any_skip_relocation, sequoia: "22b155184f7354d8749921e941af68c0f22dd5c6d69191b6c29ea34115e6a83e"
    sha256 cellar: :any, x86_64_linux: "7ed3ae0113d91ca2a26838794665b016aaed08ee13987d0ee144c971aa615180"
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
