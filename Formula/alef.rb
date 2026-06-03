# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.8.tar.gz"
  sha256 "d4f4dd96bef927577cd7db1d1c863786300920b754fcfe4788bd13e8322be11c"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "205ddbb48c66ef485df711aff1217b7a46d9cf0fed6b5fc815073ba2cded0bba"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a501f64e19d44d56c17978b6094569f7ec9550e2c73423f541c6d5c0853af2ec"
    sha256 cellar: :any_skip_relocation, sequoia: "29b09e7fa6ce45730f892429d2225f54b8f1ded1d8877e9b71036f1c73792492"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "93e3b3646dd4bf1162bde17cd034270e9703397ded2e69cd9c5be9b7b6393b0c"
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
