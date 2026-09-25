# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.96.3.tar.gz"
  sha256 "e7ea5c60118c72673125a36910ca717b1812875b3a68098602bc570117ea476a"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.96.2"
    sha256 cellar: :any, arm64_linux: "10e34fa2904429cc1efdf966c002d9c2876cbf77fd4a87eeb8477fecf59416de"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a4e8664f23ae51e16c180098ea680dbd6a09a4d1992a3927f1dc98942be6e477"
    sha256 cellar: :any, x86_64_linux: "26385530a9416ea7ca8a139d3c47e68eab416bcaa790f3cfa7bd64279e70cbce"
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
