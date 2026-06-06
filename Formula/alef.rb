# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.22.tar.gz"
  sha256 "1daeebeab8c8f8d5d84d9baab62d9bcba4daa838a23a114143e50225a6d56898"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.22"
    sha256 cellar: :any, arm64_linux: "40803b7479e9a977f73cc5aae394a500664150add9aea6fec64f6223e786c22b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fee9ae30cd5f5409c3cc67f82a63555d4b61c288c51ef2fd4a71519ea608ced5"
    sha256 cellar: :any_skip_relocation, sequoia: "54dd859e70984cac9a043450ba2b5b6a97222d3b25438804433e06db1d9db70f"
    sha256 cellar: :any, x86_64_linux: "dcd7307fb25824441ae928df6cb4e3347a7cff4ff65fb90667ede07f009f509e"
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
