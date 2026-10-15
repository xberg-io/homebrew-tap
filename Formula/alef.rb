# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.13.tar.gz"
  sha256 "606bb6d45c68b7f35d3e601b149f485afe4d2f2d60b77d7604478f772f1ae128"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.13"
    sha256 cellar: :any, arm64_linux: "2a8c6e6120d39aaeb1fda86546f3345b99df4b0d8bbaf5f110bc43b52f99437d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e73aedaff50bc7e3e9efe1c2218fe37f44696f9c079cef9bf72ec52cbcb4afb9"
    sha256 cellar: :any, x86_64_linux: "b9125b3bd08f37c675c3f85bfe2f8f51332090305d3112cfcbe8a320ec84545d"
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
