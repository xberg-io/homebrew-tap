# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.12.tar.gz"
  sha256 "c265442a4f38d7e8b0a9e9c44fbe3eef38c49cee4d3a5f88f66dcdcf7dad5e6b"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.12"
    sha256 cellar: :any, arm64_linux: "02d9a18e062679c441723284f363c3562454e9d743ab3fa5ef10688a714f197a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "33a5e2c6230c5d78e76851ae13c0d5dfac1194e54c1af51945bfb4e45b27c193"
    sha256 cellar: :any, x86_64_linux: "a00b54f19050d62c80f899f5ce8b7b4f1730d74d8d47490771c526ed72ec895f"
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
