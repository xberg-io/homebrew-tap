# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.107.9.tar.gz"
  sha256 "a7de485de1db7e925626308390d53652c99d6d244c6fe726c1da4401bfdb6477"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.9"
    sha256 cellar: :any, arm64_linux: "64412e73c08ef1f375b0f6559888eebb9a03777e29c2da64b4ef7f0feb009245"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7bfd422154f14a4388b305ed9b07f85d275ab0b384aa261ec1834924e6768b42"
    sha256 cellar: :any, x86_64_linux: "39c16228ae662abba2c059d0b2fd9c5b17baac2f36700d7737df89d618265ec4"
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
