# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.19.22.tar.gz"
  sha256 "181037442f50caf5ea9ab433b462ce3e6d48d0b2dffbb8d39c75e855a64c2692"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.21"
    sha256 cellar: :any_skip_relocation, arm64_linux: "92d5998a142080dfb77e31964c2d789a81dad71bb1ea77ab5a02ff49ceefaf00"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ada7f24b9f6d99dda721ad77daaccbc4a6beaa62d2d7562c639c1f68dccfb544"
    sha256 cellar: :any_skip_relocation, sequoia: "0132c322106e209a406fce25af9159ab095d3527b42b5a60fba0cf6771a95477"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b82a591c0e34a53f0ff22bf63157e27c303f7910f2391b0e9e3702313c329b6a"
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
