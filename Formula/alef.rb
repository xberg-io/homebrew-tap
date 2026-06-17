# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.28.tar.gz"
  sha256 "4ea65827ab84cee5c4163a2d2c8b596df08c5b242f52d0d18f55fac07df5c79a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.27"
    sha256 cellar: :any, arm64_linux: "2b18577d00f4eba73bfa4e8e3207334cb44ba5f529695f45398224fe9ff30255"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "95d4baf6f9933adfeac25e7ff8f789d7aa9420b1ca39f6c06819eb27043a68ca"
    sha256 cellar: :any_skip_relocation, sequoia: "aab9c718634f52fcd488f0b073e659c3fe4cd13edf2ec4b788a37be53a910f13"
    sha256 cellar: :any, x86_64_linux: "d1f8590107ca4369ad7e05973720eae2a407c4b7698405ec6c2d7aa720d3b624"
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
