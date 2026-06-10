# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.24.1.tar.gz"
  sha256 "b130447386d4f9e01d22f1af3e43eb3f6702db989dc3435559c8be34ba208b39"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.24.0"
    sha256 cellar: :any, arm64_linux: "730b6ef9a792d3a798fcec10f36ede4325a03bc8bbed21d7b304e7a380c78554"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "54b3c0f00a8222aa1a3036875e628470790c178cdaabdc79bf9a798a80f601d4"
    sha256 cellar: :any_skip_relocation, sequoia: "d172b41b42520f8a8637f89d1dbab3fa6b3c3398faa39848878a770f4e7985f3"
    sha256 cellar: :any, x86_64_linux: "957b179c3c30c2bbc567223e84d40fab8a0444239c262cef1054ddb483ee871a"
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
