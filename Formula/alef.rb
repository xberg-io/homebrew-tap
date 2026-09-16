# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.91.3.tar.gz"
  sha256 "1ba2b3a0f5c2e082841907833ea477d9ffae343c828124a421dff37337030597"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.91.3"
    sha256 cellar: :any, arm64_linux: "352c013ffc7be717af0290e37f0b99a4281aa73c7e367013a1919b2bf880dfd5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "da22e3c45892d4fffb4fde0d964a430cb29a39dcc92f1167b568cdb022c9b46b"
    sha256 cellar: :any, x86_64_linux: "3bd79d4c3c8c4b2cd806e633ad9c8498ce62e47438173a90e33d0b6418e7dd06"
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
