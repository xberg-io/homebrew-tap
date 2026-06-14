# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.7.tar.gz"
  sha256 "112f4671f70b8945696f3e251c8012b60d5a8002128c203b5110c3f460e8270d"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.7"
    sha256 cellar: :any, arm64_linux: "96d9e2047159154a5e055af61dc4c17eff01932254d95d827e8f2a3c74c557c2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fe3acb956f4aba9b9ea29a6f9e86ec9b5097f4466530deae19d0143c243a9d49"
    sha256 cellar: :any_skip_relocation, sequoia: "16db6a16d9be910abebc619f7a2458d6b15c47e67877c5aa9f31c297d8b574e8"
    sha256 cellar: :any, x86_64_linux: "fd0e90123e21f4a71e2a6a7301e31d8cbae52332c2a243e081199851eae364c0"
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
