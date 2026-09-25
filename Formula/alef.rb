# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.96.2.tar.gz"
  sha256 "9d21908897b19d0bf507c7564f0375367cb31861197f7c9943cb141962653c06"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.96.1"
    sha256 cellar: :any, arm64_linux: "3f1fad52baab759145a1b73cfb0150a2a4ccee0f36c2b5c328285362f6708442"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "fa7d3e3df26a00ce324adc2fb72756fef74f8a5632bd3cd1cb2587159c6d8fc6"
    sha256 cellar: :any, x86_64_linux: "42defa656710c107ab2f5c9145f48e5348bd5f5e1a48a1a52c4cf25c8eddb350"
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
