# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.67.3.tar.gz"
  sha256 "1f697e2e39c7765b6a0b353150694b0c8a9917c529824736f100121473a4950e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.67.2"
    sha256 cellar: :any, arm64_linux: "203103a32e3af13d333a4a0fb5ccc8a6e6b26e416bb20fa205adb605edf007f4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ce61f3f0239d1d0f2dd9647dfa5f4284294ff6c3312535f6f2fb429aa8eff0a0"
    sha256 cellar: :any_skip_relocation, sequoia: "d7a2dccb3f3e0d24d50d12f787bc49e307f90bc3ea49415f71dec2aa762c0a01"
    sha256 cellar: :any, x86_64_linux: "d05a034740d78d6beaea975475e6f75b435de9b3aeeb06004fbc3638a174167e"
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
