# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.47.2.tar.gz"
  sha256 "74a24e0152c2056eed33c1dce84b4f0bf6a02e6cabc8adbfe34bb99f620d2d8c"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.47.1"
    sha256 cellar: :any, arm64_linux: "5ce55d3a02234a245b3dea25f25e1446b06d01df5e73b7897a2e3506e4860677"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "70a83d1981584e4192a1cb5245e398e9392ff95726be0aa57ce1b3836fee3663"
    sha256 cellar: :any_skip_relocation, sequoia: "d644321d6947398a0688e5c02f0a782b7e86db9c98a56dc760bd350a439440ea"
    sha256 cellar: :any, x86_64_linux: "889a7dfd3f4fbec6dbdf4537dee9a63b0eccf787eec2cdb96603375fde9cf602"
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
