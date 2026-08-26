# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.69.0.tar.gz"
  sha256 "5aacbf4e2da9038fece1e2c4030f80b95918e7ef0b7fb923f7be4fc26d183bfa"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.69.0"
    sha256 cellar: :any, arm64_linux: "c79d40414a08a8e6400684a999dd618fdbf522747252103ea40b7e5c40aaaa7d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2213de3d2b6a4e6d8fce408cd2a2adf07dab333e58fc585d2977ba097348758f"
    sha256 cellar: :any_skip_relocation, sequoia: "0403ade9e9088f0d5c50782b32f2563b0a00470eb345a76837fbbbf10bb4e004"
    sha256 cellar: :any, x86_64_linux: "58b17f495a46fefa1286387039e835b6d46ae5ed9767c1596d04acdc97697689"
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
