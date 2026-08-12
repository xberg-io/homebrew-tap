# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.60.1.tar.gz"
  sha256 "8e2e717181c6a3bd0c50a35a0dcbdd5c91babc2c8b4e770972b1efb7c15453e8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.60.0"
    sha256 cellar: :any, arm64_linux: "5c1093c086e9df2c6e24d72594cd629a9343db9386051d519ab3fe0cc3d67e3a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "57afea9fe3566c9956afdf7be128fc948ffac3ded657891ba4d6db31724341a2"
    sha256 cellar: :any_skip_relocation, sequoia: "6d5624e4b27f94906aa46c5e7a6ae940121d0a8a58282afb61757802e0228a8c"
    sha256 cellar: :any, x86_64_linux: "536c4cd7890b00641d946cd92fe96a6d43bfcfb50c075f908a0b8ea64deb6db3"
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
