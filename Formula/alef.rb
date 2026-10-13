# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.6.tar.gz"
  sha256 "f3ba32f88ecb7eb583286f1c1f476fc94fa777ed694573cd74836e602649496b"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.4"
    sha256 cellar: :any, arm64_linux: "1d42d1ed7702bb55550b387700ef52b024ed8ed99177db461f22622b41b20ac5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5b1ff3f2788dd6dc5b163df81a4dfa815bd0a44173d4d170893958a8ebd85110"
    sha256 cellar: :any, x86_64_linux: "be041169c8b014d2bb60cb8fe3eceb93355e10176fb602a83c6128090278af97"
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
