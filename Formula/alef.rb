# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.92.1.tar.gz"
  sha256 "fa297e72f9344b82f53c2d6b2b7b8230cac5ed783f8cd7f5db549f7d519e3cd5"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.91.6"
    sha256 cellar: :any, arm64_linux: "ecdf5c9518b411727ccc121caf8f2985be8ad2475a0519e4b3c2fbf6ffd42e05"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8193a375a7bbc85586810a65489e72beb9295771181f04d272fde04595f1b696"
    sha256 cellar: :any, x86_64_linux: "ce31b3906199814e1f6a9b4bac2c5da1a850f0219bf01c759d12a3ce5cf5a58a"
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
