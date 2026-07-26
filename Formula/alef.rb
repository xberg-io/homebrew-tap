# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.0.tar.gz"
  sha256 "80efb2a21e02dbce3c378e07796396d4781eecc39b7f8dddf77e37a83ff110a2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.47.2"
    sha256 cellar: :any, arm64_linux: "284e386321de42644d55816a525e8695fac5d63091c22696a790672120ad6941"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "09190c7b95629be9046946da6b35740f89710d302cc6542f0eaa5c02409cc5f0"
    sha256 cellar: :any_skip_relocation, sequoia: "02493d3ff1fc847072c6776c2d2624e4ff32162bff47e7562a154742a5dd7f15"
    sha256 cellar: :any, x86_64_linux: "cf9400e4087003ebd203acd36e2d3917f24b91f4f923d6ab0f3276666b9b1b05"
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
