# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.30.tar.gz"
  sha256 "97006416f32c570afe2e80d6f0988c260b122f3f96ef38fe861377dfcea14bdc"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.30"
    sha256 cellar: :any, arm64_linux: "97713cc939b93aa49e6237fc1fb52f8a7509b5b700fc29a5fae0879223d4bccd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "35e2a17994cf81b45eeaf3d882ac91c8d21aac34c789c98ddaa5e208402e88b5"
    sha256 cellar: :any_skip_relocation, sequoia: "426ba19702ed5034cc8cd299079ea9e6c113952d06eebcc7f79258fe8518968f"
    sha256 cellar: :any, x86_64_linux: "3d798c5b2fecd27853aff9ae8fad9ae8ef15429c2209a658b7d6fddfc1b69e84"
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
