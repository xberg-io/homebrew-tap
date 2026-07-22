# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.42.1.tar.gz"
  sha256 "afffc907b3c9bd29b72b73d636a148398e62a570e0f526ce118966e78acdfe85"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.42.1"
    sha256 cellar: :any, arm64_linux: "3ba559d863858ddcfcef6fa669122fd33e7b5fa0ed6bab44e76d6f7119915f94"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "566e2ece61991edc55896484d8aa08739e69a3a765a919f6d04bf33485d59d7c"
    sha256 cellar: :any_skip_relocation, sequoia: "2d18f0bd7ac80e46e745d66e079a07d55ae753cf28565cfa39acb7e9856034d1"
    sha256 cellar: :any, x86_64_linux: "122c40e12eacbf194f93cf3be9968b628da9923e7978553aa420a8e627d8958a"
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
