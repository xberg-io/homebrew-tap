# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.3.tar.gz"
  sha256 "886141257a1e7cd493ab1a0587a894f0135022f1b424e05654b62a84784db72c"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.2"
    sha256 cellar: :any, arm64_linux: "8877cb2395bcb8dfd46dff97ebc68dae19adb337512ad4aabc1a118db2f41ab4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f73df7ce03017aa17b636e12f2d8acf5dea1b57e1e43b22ca774e9a920f8c7be"
    sha256 cellar: :any, x86_64_linux: "589c0ea2288e40cfa93f75ed93dc6dfff8ded5d7b6af37f22cf7a760ae045e53"
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
