# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.55.5.tar.gz"
  sha256 "0ec7d53d230d982f5cc2a845de2855c294f6c48a75dbdc2cdc50f77d838a7cd4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.55.5"
    sha256 cellar: :any, arm64_linux: "6737408c7b22cedcc274e1b8fc77352e1cf0a85a8ded38753c6df3668a4fe60d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c33b56e3365658a7fefc1d4b16b1e45bdb846726c6b83ec5b330beee67e10981"
    sha256 cellar: :any_skip_relocation, sequoia: "36bb7c7966708acd04105f3ce071d73d14b28246e2f96315fb564530d2cc38dd"
    sha256 cellar: :any, x86_64_linux: "657b1d28ce9805434c57fe82ae437027b6d676d749931894e9f54ae828ef3593"
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
