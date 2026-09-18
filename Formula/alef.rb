# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.92.1.tar.gz"
  sha256 "fa297e72f9344b82f53c2d6b2b7b8230cac5ed783f8cd7f5db549f7d519e3cd5"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.92.0"
    sha256 cellar: :any, arm64_linux: "5a70197063504d6f17f5a99c449780c50cdd3e56cf39c0339b905069adba3699"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "80ec839bd32ac6a5c11a8bbe662b751df198f01995abce323dfa45d049f64a05"
    sha256 cellar: :any, x86_64_linux: "55a21de25b4684902f3f9746e47a0864ee86e0b5cf546002b4936be8e681c92b"
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
