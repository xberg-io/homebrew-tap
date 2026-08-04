# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.53.1.tar.gz"
  sha256 "d0b4cdf47d9a0de26ba1c88d387588c2a19e953b8a05b11e4699d247aa6c5a80"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.53.0"
    sha256 cellar: :any, arm64_linux: "41449e9ba5f72c95375ef51c16543b5afe9bed0a5034d1ce0c7871b2c14291fc"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8e2259a1a25214a2e4001658dc0b1078f96cb3a733b8ad5a34536767e4a606c8"
    sha256 cellar: :any_skip_relocation, sequoia: "d8944e73fc08a9c60eaaebae8fe238d4d17eff12aba7d28862dad580373b6342"
    sha256 cellar: :any, x86_64_linux: "651249e95f2a52c2055dc9222597b5915954818ee47a933a2551dd5ea018fa72"
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
