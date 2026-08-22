# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.65.0.tar.gz"
  sha256 "f55c7bab86bd0534ba1d3e6973a39f7845b488f6f2946c0654bcaebefb415872"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.64.0"
    sha256 cellar: :any, arm64_linux: "9af370350bc098f998fb2296e88e0d56ff267b68567ed240485f1030567f2832"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4026da5d0612cdd51463c7f0086cf0b54720f0f38b6162aa84005762cebf4dcb"
    sha256 cellar: :any_skip_relocation, sequoia: "c87d3cb172613f77bc30e7dc03a9c9fdf7036ae1b3c905b981bd3ea4389d5c11"
    sha256 cellar: :any, x86_64_linux: "88709271c6dc042a79a62d06b39c384edcaaf1bba08e13304dc10b1b540f310c"
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
