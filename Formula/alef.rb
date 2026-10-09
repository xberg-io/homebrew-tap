# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.107.9.tar.gz"
  sha256 "a7de485de1db7e925626308390d53652c99d6d244c6fe726c1da4401bfdb6477"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.10"
    sha256 cellar: :any, arm64_linux: "19d5df9df2fb072d6887569365911bc94cfa61dc384267e03fe8dc922fc4c5fd"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "87e2c8622d8c9e33c3b04b4896d62cd1aad3de4f587cc1338c749bb1ad35c00d"
    sha256 cellar: :any, x86_64_linux: "655fe9d420d4503bda5171a7accadfa7ed98948acfc25fafc5154b85d79d28c0"
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
