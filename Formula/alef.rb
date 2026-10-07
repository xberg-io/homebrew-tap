# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.107.1.tar.gz"
  sha256 "b438b1623d81aeedf1bd1d70e364efa1539ea0f3ce819a082f3e1d1db2d8e0f3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.0"
    sha256 cellar: :any, arm64_linux: "5ad1dbbda3da33232483391da0ebd323b06c05c1c66d5236c9164acc12566695"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0542f2e61ea343ab036cd45203cf28e0052073d442de1c22d92071680413a131"
    sha256 cellar: :any, x86_64_linux: "3903b19b0163f13939d5ac97692ce51eec1cd38763f1d3f88b3d6d352af3b1ba"
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
