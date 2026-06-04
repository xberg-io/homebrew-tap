# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.0.tar.gz"
  sha256 "d774513e97b5a31871eca99d62e468758eaa9155db001d93ae746e388cd41a1b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.0"
    sha256 cellar: :any, arm64_linux: "3f6cd6be43f9f09ee81ed59eef0b72f7294d606a317a4fd0d0d8b15e3d998ba5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "19645cedd8a49a08bce30654906577a591eff1914d3d4ca0372b804a38746f14"
    sha256 cellar: :any_skip_relocation, sequoia: "a3cb4990f09d3db8cce5fc4456216e9f4b3632529e8ea2d159febbb42190e153"
    sha256 cellar: :any, x86_64_linux: "5cad5edaccaf6af8067f25f23bec3019a85ead6d3f952a0a12e217475c54882a"
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
