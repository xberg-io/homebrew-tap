# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.4.tar.gz"
  sha256 "68b4a44ad8f5ba7e40ad0443f7eb6314f7c734fbd4180bd4531a19ad4f74f816"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.4"
    sha256 cellar: :any, arm64_linux: "41337a62bf71e4b1b2b911ccf403db99d5c6d10592fcde2a2d3ba674cda4805b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a3b4345edc318ec2a1ed5459d830aaf4571c75d2b0a4258080bdc498a6157f27"
    sha256 cellar: :any_skip_relocation, sequoia: "4a820b67e7603d4370859cd0716e9e25b28995a667489753ee90e0823bd45a63"
    sha256 cellar: :any, x86_64_linux: "805f20afa8cd85555266b0b9db2c0c2aa22b5d9ef1812a496a248d0daf72effc"
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
