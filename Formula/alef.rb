# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.1.tar.gz"
  sha256 "6cb21862e336d5740d8cefbf1496704061a7f5fc20d0a4dc64b4020cea4efd71"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.1"
    sha256 cellar: :any, arm64_linux: "63ef915c0d06da345064fdf1df286bf1675b5ae054f2cfc3598c1ec6c5a5188c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9eeaec704a128adc35d714f7f51bdcc359ab2c7087ecc335c82235a3b89dbd93"
    sha256 cellar: :any_skip_relocation, sequoia: "4267f17f9f9e7af5a0972175e20eb7d51abd119fc598f2149b45eaeb4e216b6b"
    sha256 cellar: :any, x86_64_linux: "d4ae660113ba87b94ff58b55827bcaa8520d8f93f0108f93596658b736d86440"
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
