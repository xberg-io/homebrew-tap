# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.43.0.tar.gz"
  sha256 "2ad5548b98e6e01352d0e829320ac42acfa6e77aa1af51eb788152bcf3b7d716"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.43.0"
    sha256 cellar: :any, arm64_linux: "a09c727b3ac221b75ab8862ec891e6c116b723ed16bb3c8d76d181ce068ac0b1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6a7260609dcc10c3cba6385a965cefb3c4cde84efc7d019c1c36bd2f029b4c06"
    sha256 cellar: :any_skip_relocation, sequoia: "dbf89835586cde79b9f56024aa276ed2df3c42ccd532782344d43eb561d2073f"
    sha256 cellar: :any, x86_64_linux: "9078465099cb634ace1e97ba1bf117f7aa9073e291bf8e8464ddd8856c9099d9"
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
