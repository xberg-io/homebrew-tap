# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.34.2.tar.gz"
  sha256 "d72b52e89ef6244370c09d35e8fa0e94d01a225abdf83dcbdbd4eac7cc28c0a3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.34.2"
    sha256 cellar: :any, arm64_linux: "eb22613bb9840aa8cd33f4baa5e380f92074cf67ee9336e24b1a62a9d629ac83"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "646a9b1bf128d80dfe7d701384ccd5a32f40c14331c4cbfffd90b4d15020cafc"
    sha256 cellar: :any_skip_relocation, sequoia: "7c8b102f04eec7e55bf4731514b39a270b7d53f9d6f8c33b625f28dbafb9b387"
    sha256 cellar: :any, x86_64_linux: "8e520451298d6e420faef4ec11888c22af89887c2707a1b9a318dac8b69c49b4"
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
