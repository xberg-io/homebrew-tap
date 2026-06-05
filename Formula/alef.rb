# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.8.tar.gz"
  sha256 "59e080d7c66c42114f9770144b3cf8e453889d3baeaf921b4df1c19cb3eb67a4"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.8"
    sha256 cellar: :any, arm64_linux: "143240250dc6996f64c717b7b869c9d297f089e378ac29e6879c3c06d12274f7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7c445b398d697eb330089941d83c54f8ad2210632d5497dca255ce4b52e53415"
    sha256 cellar: :any_skip_relocation, sequoia: "c34ad004a32030e171d2aa94ed1d89bd46a2c109da87007c68255c742cacd1ab"
    sha256 cellar: :any, x86_64_linux: "15e270709acc507114e3e0be8376c30cbb61d8bdf89e82d1f8dbe23e5e1a55df"
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
