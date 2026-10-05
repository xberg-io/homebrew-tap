# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.19.tar.gz"
  sha256 "e4face8f55d96a996caab89ac78e58f96575ca1e0e73beadb25015a7960a1240"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.18"
    sha256 cellar: :any, arm64_linux: "440f4a7a14a3cafb6625c8ab0f0b408310620f55c0dc86f59379254d2de169e6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4b3e98e76fbebc3318c173327a3d3570f381c4350bb244364bf3d0895dfdd2d2"
    sha256 cellar: :any, x86_64_linux: "52b322583cd8e0e131bab5c4723799056422ca8fddd9079b1c3135fbd8a693d9"
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
