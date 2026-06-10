# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.24.0.tar.gz"
  sha256 "5c1b15d25728d49cf10db9d28180a83ee2b16a16de3c1ecb8512e5c69ffb7f47"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.76"
    sha256 cellar: :any, arm64_linux: "7bdbbbc2b4f6042ce49920bb4fb7ee783823368649271a356093d12e2d42e693"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f7e68ffe5b39e1dc4683757a1b9823441160c9fbe382cef8a71111d9a0fe2515"
    sha256 cellar: :any_skip_relocation, sequoia: "53a3b1fd5e4e7f828f67d119cec13b1e8ead3629916c995653e47017275b5315"
    sha256 cellar: :any, x86_64_linux: "f0a451566d7c7f5858096d40b36776edce2d007724bcd8601d2b102f373e2308"
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
