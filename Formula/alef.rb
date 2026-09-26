# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.97.0.tar.gz"
  sha256 "1ec7e19d771edb99ea2d4d4ae4d26f885ec6a498655ccfc4b70e4ce4e8be9516"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.96.5"
    sha256 cellar: :any, arm64_linux: "2c40524d310d7c4de9223eae1278012d858c2a00a1c5ae370a17887498d3cfa1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a22d1672820efacdf51b0ec5784a315ff93264be4136424f99e6e5c2f9ef2a99"
    sha256 cellar: :any, x86_64_linux: "934608888b1d124e8c7a31eeea307a16f01e58dfe704ddefd90c51e3710eb156"
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
