# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.2.tar.gz"
  sha256 "3d57eb58b944fdfca6ed492d60be7caefb83bf5f3b17c59ea20d17158439a86e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.1"
    sha256 cellar: :any, arm64_linux: "e1bdeb8b4b7b586953d3bf7b53aacf31caf0f936eccd7f4bfa81aa3b1c14b1cf"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b00f55524c39e44cc9a688c85904495c6c041490eb5e3c26f48dff78d05a99b4"
    sha256 cellar: :any, x86_64_linux: "67b41e55e585af14b25e2e176fb1be40585fba8017a955cb58ae8699c2a8f53d"
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
