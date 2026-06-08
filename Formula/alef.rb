# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.39.tar.gz"
  sha256 "ae7bccb76f12531e91438ea8cc1d8c138ac347f106445eecdccbfa23c4cfbe7c"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.39"
    sha256 cellar: :any, arm64_linux: "d04bdb0ae75723d665869153863d213e6e95e0596949ad5f4cec8a83f720d3f8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cb6f4f44bdd7c24816cf8e5e71d78c5d94ea643233a9c4af1a20e77f5e6e2b83"
    sha256 cellar: :any_skip_relocation, sequoia: "0a62dbee5b0ec0fb837033a71e8b542d3de1dbda3f293fc6ab134a27da5b9495"
    sha256 cellar: :any, x86_64_linux: "97c13463af567e4f7de00f1d2c50f75f54ef47640a1e4b81797c8f52cf65e53a"
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
