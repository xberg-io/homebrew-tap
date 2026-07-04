# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.3.tar.gz"
  sha256 "e697400564399427aa592102b90325b1c3ff6bed0045a2f4d0b2366699607c6b"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.2"
    sha256 cellar: :any, arm64_linux: "119aeeba95e6546ca661904c7827eba9edffeda5b222edb90f493a3388383877"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f0dfc562aae96b92d56fbb74b408fab9bc4c0b12e3a1f3a6f9348a7edc86134f"
    sha256 cellar: :any_skip_relocation, sequoia: "58ca7dbddb84585686584ef5cfe785b20e23d01ee06b26641968f378be7d3416"
    sha256 cellar: :any, x86_64_linux: "3dde91ab76ff89429d092c57408c96bedc110a2f9b108a84d880a87a04b57e30"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
