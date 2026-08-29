# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.77.0.tar.gz"
  sha256 "11adbe6557ecb4c341f486848c54e210b6ccc59c95ad7b2e2311c59be0f097fd"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.76.0"
    sha256 cellar: :any, arm64_linux: "dede26065292e443e18d541c60305151e1717c7f37b60860588890e1b2042696"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "637cadd0f39b0aa49357c5f0a573338be06d26f772d5079dcf8863b7e4bd25d8"
    sha256 cellar: :any_skip_relocation, sequoia: "0a978c7a16962737bf3a033b8c03f7e6fe9efd0cd1bdd63c784104b0d526ce18"
    sha256 cellar: :any, x86_64_linux: "4ecac2a10fb302253b28677b67dc7b21b2dec46ad6f3b658323cde6ad3ca16ba"
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
