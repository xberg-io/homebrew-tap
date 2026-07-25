# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.47.0.tar.gz"
  sha256 "df6f8927c4bc2fab49180aefca01fd4c7ad6f81b5006a1cfede95d5b4b201fca"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.47.0"
    sha256 cellar: :any, arm64_linux: "7576f6c7603fca3957eff3c0884550b15d78d6e6ab263319dac1b3e6823c5c39"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "46738288978496cff6f9aec0193b4c8c79049c3cf1167c7853c8bc9908487a06"
    sha256 cellar: :any_skip_relocation, sequoia: "dca72f82d04f38665a58a731fc4b3fcc8a30573376f213ebe2bdb7bd94e8c2ce"
    sha256 cellar: :any, x86_64_linux: "78f054d18b64e0d4f8cf38da784d10246b02583a6f37103b794f234ef1ecacd2"
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
