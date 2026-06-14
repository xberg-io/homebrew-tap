# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.0.tar.gz"
  sha256 "f9bcf8e00df03a217cb6e43d03d64257d31d71ca019e593186db6a0a585659ec"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.24.17"
    sha256 cellar: :any, arm64_linux: "48e2798080eca81dcf6dd14f8334bc95ea2e1c5bf9c5fef8735e7167d0354ecc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b38af77ff7123d06bb9b6db0196098dac72cdf99aba3acb6b5c702550a813e91"
    sha256 cellar: :any_skip_relocation, sequoia: "5907b7d0ee255d48e649a68132f8cb92b606aa63453c0c85c13373fec104a574"
    sha256 cellar: :any, x86_64_linux: "e9c384c53fc752c5b6eb74c47df9aa6af27d35053557269b1b56d2100d771d14"
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
