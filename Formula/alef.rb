# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.68.0.tar.gz"
  sha256 "08a9208c3922583e5c39164c72533e17cb399c68ee7790c624ab38b8c55ddc21"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.67.6"
    sha256 cellar: :any, arm64_linux: "6b257b3e815d93ef0301bc089868ff24aa536666a28c598103322c46c2684607"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4af6d44cfcf4dc9ecebcb6713078571e84513ee00b05e392d9dad0619879f9c9"
    sha256 cellar: :any_skip_relocation, sequoia: "ac09fef643e9714c14d3fc1db8ef37cd64b68c3e247d766dba32d058a049aa58"
    sha256 cellar: :any, x86_64_linux: "529108f4f4273ffaceb08db763349c8236968ba7c902785ba83a66501f9c4bd4"
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
