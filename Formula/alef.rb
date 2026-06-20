# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.57.tar.gz"
  sha256 "f0b6c330f78ba567f24f805807339a8a9416276520f1aa11aadada12c45fd94e"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.57"
    sha256 cellar: :any, arm64_linux: "ebbf27d2e19ec2c6ce4387101bfbb5f2a31852e3cfe1599a0801ccb3d63b0154"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6b69171aa3d988dae4a11367141f5cebfd66b323119980d33b81db2d2492263e"
    sha256 cellar: :any_skip_relocation, sequoia: "cc949db090a1c58a5802fa99a3bb80e2e5099b2d8d6f41d542b2b8cbfeabc698"
    sha256 cellar: :any, x86_64_linux: "3da5ba37dae341874dd973e208de9c983bccedf2fbaaa13a749eba5e34eb9384"
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
