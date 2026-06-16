# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.18.tar.gz"
  sha256 "0f8b622fa4f1a7e292b5860ad3b39d5ce47053a5736ff0af28ac734875f039ef"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.17"
    sha256 cellar: :any, arm64_linux: "df2068aa642937bffb0cb4dad19237ad587248ee500cf02585803a3cf78f45b1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "13ec931f017974bc861909fa16b3de39d2f6bb20db8652fe6d857d894be4a126"
    sha256 cellar: :any_skip_relocation, sequoia: "bf218370868a65c4ee2606b38f8bb8a74a59035ac579430244545bcb80cfc856"
    sha256 cellar: :any, x86_64_linux: "12702606e7aa2a8c2ded756373bdc8ddcbbb6fa1dc9327139187c1ced368c957"
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
