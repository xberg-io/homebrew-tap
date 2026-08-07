# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.57.0.tar.gz"
  sha256 "c460bc0edd7cedaab8e7b0060a1a060ecacb7842c8db6a5d84c4e243100ef5f6"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.57.0"
    sha256 cellar: :any, arm64_linux: "e4aa7993440d787588b90db8a134145c93b5676f6ff4f29bd0cedfc2556fe4f0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a56e8522ed9b397a5b4696d8e30d6ab1db8fa4ede9cd90a43ba2f8c8276504e6"
    sha256 cellar: :any_skip_relocation, sequoia: "894a7504d8be1cbb5a338431a925a587eb66e6c4f4189ae05de2618a6c4fbeff"
    sha256 cellar: :any, x86_64_linux: "e8d364453e6c788d3198b93e103abc1264c7ceadf151dcfa3a9dd4aa768a13e2"
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
