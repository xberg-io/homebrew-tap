# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.1.tar.gz"
  sha256 "7e1da3c5365e85edd52ad57ae446e93f5004e7d9f9d7ff61fc75a0220ca35638"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.1"
    sha256 cellar: :any, arm64_linux: "a9f22a09dea2ecc397cf87185b8dc89d83b6ed2fc32282047ad10af381beeb46"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "242d0fda09cbb033439463c475297f20a402551af481cd489c06eb8f96dca09b"
    sha256 cellar: :any_skip_relocation, sequoia: "c2964435bf28b06f83c016ada1e6ba7ae687e87ae37096fabd06075223d3e60e"
    sha256 cellar: :any, x86_64_linux: "1d59318c6e24ac6647e4476a7ab9aa741d280e804138ada25730141e0725d13e"
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
