# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.47.tar.gz"
  sha256 "fd4917af4a07b102914e465605d8c359e0c9565d83b84dba61127edcd9c17e3a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.47"
    sha256 cellar: :any, arm64_linux: "0d7421596dd974daa9ca1331dd7f8887adcb4ab142b5b6f9abb71c703375725d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1bf0abf6793ce476679ecbcb276daeb79630c3b5ab5ad7ed254a2714836fbb8c"
    sha256 cellar: :any_skip_relocation, sequoia: "8a9778fbe13fd5b18a0ea5523f82da27f94b925cc8b4d4c0ba7713032c631fa5"
    sha256 cellar: :any, x86_64_linux: "a0d520d718cadbdeb007f5811d379a99ea21c2417e24fb1f66a9d9862e166c55"
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
