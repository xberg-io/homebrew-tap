# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.8.tar.gz"
  sha256 "ac452dbd740235e364407fcba2e8a127b54e00fc9e3464fbc50d480c2102b8a8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.8"
    sha256 cellar: :any, arm64_linux: "58af7540ccd11ca5f824b280617c9c446b3a23310abe0f7338c0c75ccae2204e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1b32e23d7a1a506ff4bb05d26230e4d85fe3c8e3d5dad0c15f6207011cffccf7"
    sha256 cellar: :any, x86_64_linux: "71f1bc883d17bf03ce5b9354b5680f60a3ca007d13f2797e0245ba3afb1d0830"
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
