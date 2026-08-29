# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.79.0.tar.gz"
  sha256 "1853342d78076509360ddb45e5d2ce472464d9115b5d98323f78fc152f5de055"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.78.0"
    sha256 cellar: :any, arm64_linux: "53e1622f203fef3da521b62f6806c53851132f5187a8ce5eaebd2b2d7360b1fa"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "63a49aee2f023e225a2a8af64c0280d0a33d38d298736d3da84665cd7e3c6794"
    sha256 cellar: :any_skip_relocation, sequoia: "da8d8eb156b9274be37f12946ac0e578370e88f67c7a65c350a2a0d190d93d16"
    sha256 cellar: :any, x86_64_linux: "6095da3b1bb3437d84191af7180bae950714a6026df0250810f32f41c9bc8b73"
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
