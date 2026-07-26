# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.0.tar.gz"
  sha256 "80efb2a21e02dbce3c378e07796396d4781eecc39b7f8dddf77e37a83ff110a2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.0"
    sha256 cellar: :any, arm64_linux: "ea33c7ea4d4f3c31f084c1509efc230ac1a1c237f19eb5977aa03a1fef10f7b0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "85f02b16315339d05150d1057de2019f3dcec8152e06cd001f036d32cae88576"
    sha256 cellar: :any_skip_relocation, sequoia: "feb5099faede5ea97baf46a9c1b9d4509b4e9d700526955ce9665061da94dc7e"
    sha256 cellar: :any, x86_64_linux: "87a641438aab2acdf2a02043913cc83620aaa2c409a63653859a0caf7e0f9574"
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
