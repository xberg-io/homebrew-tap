# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.7.tar.gz"
  sha256 "8c97f5665f5c80318800015813d16775f107025c36fda3655204a609e890389a"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.7"
    sha256 cellar: :any, arm64_linux: "713714ba16009aaf9203622ba2b65282848b3f43ebcdeeec849af33c8d4c183b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d1a7e0e8ae0429eecc2cae7a1645a996a15835c10bfc03daf0a00e463b0337d6"
    sha256 cellar: :any_skip_relocation, sequoia: "a97c0682c033d4dfb7e9648643d711f0cf594dd27e2ddbaf28eb329d25609625"
    sha256 cellar: :any, x86_64_linux: "a9c1e07e2ecddb6572b31ffd093909a2c8b150340bd17cd0b7bda623d596540e"
  end

  head "https://github.com/xberg-io/alef.git", branch: "main"

  depends_on "rust" => :build

  def install
    system("cargo", "install", *std_cargo_args)
  end

  test do
    system "#{bin}/alef", "--help"
  end
end
