# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.79.3.tar.gz"
  sha256 "8d340065e4c3a002d47458073b04c5fd1358db5932bf1bc2c8a02d71c6f4c363"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.79.3"
    sha256 cellar: :any, arm64_linux: "60bb308babd063a67df82f4a0ae1e143051fa6a884e9147950b91f8e886bcb5a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "fe6ed61d25cd44e9c31bf6526754bd43598bf240c68b370461711e5975d506f6"
    sha256 cellar: :any_skip_relocation, sequoia: "4d1312d723369eeac930d2d8ec5cb281dac45ed7d197f01d1e32dd1ac8eb7ebd"
    sha256 cellar: :any, x86_64_linux: "b685398e6a398ad3b03ea43f02ad36aaf59cefa0efd7487d8a4faadab7a31a6b"
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
