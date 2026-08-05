# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.54.2.tar.gz"
  sha256 "bd3a337e7d7e65e90cf7786132e3d6e577cc03c4a60601cb5a68e1b64a9679f4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.54.2"
    sha256 cellar: :any, arm64_linux: "8dd569c13f82bcd449eb24553a40fb6e454f5395a5052281ed6dfcae4118402d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5ade508a4f27605150fa56e83660b64b24157cb10f328128a1d0a13af0b1d430"
    sha256 cellar: :any_skip_relocation, sequoia: "93c870b3bb5c0320dddd62e2cffe93ffcd879e0a401ee681f1f64d6080498734"
    sha256 cellar: :any, x86_64_linux: "403af41ed0fd446b33f9c791623f675a0a9935d4b25a47d63e238e1c2751a128"
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
