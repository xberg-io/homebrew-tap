# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.8.tar.gz"
  sha256 "6160da25328291979dda9e4cd184ca1240019093e2a48ca4b6f42676cb848549"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.8"
    sha256 cellar: :any, arm64_linux: "3203a524458eea251bab3e25e4f736625f6bbfd66111df78cafc16880aef13e0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2518f6f12cb514b2d16836390adccf893dbf69a8defdf2747c8648ba6b5ad556"
    sha256 cellar: :any, x86_64_linux: "812547a6951024dc57838ca7be56c139ce9c82d5df0efaf7f10a1669b32c3aa1"
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
