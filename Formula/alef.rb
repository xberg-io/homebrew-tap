# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.39.tar.gz"
  sha256 "ae7bccb76f12531e91438ea8cc1d8c138ac347f106445eecdccbfa23c4cfbe7c"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.37"
    sha256 cellar: :any, arm64_linux: "1a1c4821673afeb2820b3232e7a46dec18b64aebb979852ebea5db5f90d97bc8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0c55fd58a78e80abb9656730f681f7a8a401cda36336ea185d13281cb8dc6aec"
    sha256 cellar: :any_skip_relocation, sequoia: "3454236a1d04fd556f7a2549ee39e6d42fe7ed001c9cd65351636f266e1885e1"
    sha256 cellar: :any, x86_64_linux: "09918f7e302e349151ec76c5be46a4e1915261782263ed92f51934ee308302b5"
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
