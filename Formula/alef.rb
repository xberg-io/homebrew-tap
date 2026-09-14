# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.87.1.tar.gz"
  sha256 "e69e377f2b2a0cb9710720380e8aa415b2bb54ef355e1db163a0e1b93ee06618"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.86.1"
    sha256 cellar: :any, arm64_linux: "9bd3c82c609304fdc3ebd464af61b701329d00656682511d14fd0e6b635a9e5e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "de013a62295ae94ec0dd960537555a2cc9f2d835654cb57919807c0afec800f9"
    sha256 cellar: :any, x86_64_linux: "cf8d2db01e3f1972ab2f01c6f94eea13164852b04c683412e1c8acefc6f2654a"
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
