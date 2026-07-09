# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.34.5.tar.gz"
  sha256 "262ce86e21e002774f760a239de2b883e273eaea824f8a4558c5ce1bcea711dc"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.34.5"
    sha256 cellar: :any, arm64_linux: "c0bdee4e524eb5b43959f24202c7d419bb586034c43f2ee1c6c8500c7d6451d3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8081672531e901811f03f3114419d1d7a110d233c5a997b221384e92f73965f4"
    sha256 cellar: :any_skip_relocation, sequoia: "3de8b399ca1b265fe59554b59486b4fd6740f74ad99b966173de6d1b8c358601"
    sha256 cellar: :any, x86_64_linux: "c1655a58b021cc57b9e6dd1d6e191d64f6ca04c795d832f8c3ad52461f362029"
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
