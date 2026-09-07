# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.2.tar.gz"
  sha256 "fcefa6dc4f57742e5c0cd88d71e3c562163a213de0214e0f673bf4ee275217e9"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.1"
    sha256 cellar: :any, arm64_linux: "0b8147d6de238a59f02cfce6408f85d83a6d1851b139b635ec754a097f7f0191"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3dbf423cd7e5ec54c588a76ca21f341f0d19b25f0218f7d27119cdc5bda86073"
    sha256 cellar: :any, x86_64_linux: "af374cc7572505bd4bba7e5746375808dfef79292a1c29e0695c0cbed55a3fef"
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
