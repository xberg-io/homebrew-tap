# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.54.1.tar.gz"
  sha256 "36d7d068798e9110353177172324d2d6ef9d4536a93029cfde43065e38e92851"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.54.1"
    sha256 cellar: :any, arm64_linux: "fcf408323334231a39cc2259eb8e05bd55a3f2b707895fc415ac891395a47f7d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "574c244f2fc4744c778ed746a5d0d6e31608e2de135907001cd215ecceba6ac8"
    sha256 cellar: :any_skip_relocation, sequoia: "d6a084a160e67abf15b149ec35e5c018e22221783e8f6833119c090c71d4b50a"
    sha256 cellar: :any, x86_64_linux: "292aaf1d7cd6437678f42147d72155f3e9b1b2be2361a2cd7d7a3ad6a4b4af83"
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
