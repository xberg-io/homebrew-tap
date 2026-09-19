# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.93.1.tar.gz"
  sha256 "a7f5fd0cb05496b55267bf9a06ba129bfe274cc2f14ced76524362f27d289703"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.93.1"
    sha256 cellar: :any, arm64_linux: "25ddfcbe8ceea90726915c8b28fdcb2d77f6f9ba658f1c9bee802e5bd4e3f185"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "aaec10cec5c829b57f73cba1f2174e14f15c0062155cbaab46cf361a020471a0"
    sha256 cellar: :any, x86_64_linux: "e2876eb3511846e8163442f060e7ad971af15fdcf64d1d7d8d86f88a1d18abd2"
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
