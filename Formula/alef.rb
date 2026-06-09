# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.61.tar.gz"
  sha256 "190f9961c9b669927793cc320280124cbfdcb02ba8ddf95bc4519a9cc549ac5e"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.61"
    sha256 cellar: :any, arm64_linux: "dbef4f7ec0b3f7102fab4a05d39a9c91c29f742c7012246c9443ea9fcccfd76e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ae396f9f3472c10f9ac18ba7e13e3c542ee51835e5f104cebb73999063e59efd"
    sha256 cellar: :any_skip_relocation, sequoia: "a2d14ee66f6dd39556dbba91c6c8ca3631eace89652b49f12dae51c422595c5b"
    sha256 cellar: :any, x86_64_linux: "bc718ce623820a87fef3f53a5785cdb1a6d224f4427daf12422c4ca6f9a81c51"
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
