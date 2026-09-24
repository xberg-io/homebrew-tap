# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.96.0.tar.gz"
  sha256 "bf3514955b4d64b91b5b90a857e01ba13f7b169fcefae77f709a49ebdfdddb94"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.96.0"
    sha256 cellar: :any, arm64_linux: "08cf3026fdf6fec046e4d151c3805c1cdf815831ad81c4157f43de50cd494cbb"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "15a398f312e893673c0c381bca1bda88fe588bd0dc56c1aab70dd587157230bf"
    sha256 cellar: :any, x86_64_linux: "14eb951f6499b8fb3929f0d2145cf4b8b92a6fa119b663fc6a9b67d412dc0bb7"
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
