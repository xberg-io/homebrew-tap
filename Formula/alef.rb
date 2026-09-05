# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.84.0.tar.gz"
  sha256 "ddf533cbb0475265776415e44c50a9969bfac5086fad81a30a18da5ed7fd2031"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.83.3"
    sha256 cellar: :any, arm64_linux: "f06a15978d589560cfba928e7d5015ff1176aa72c89bfb57e5936bfb0620b270"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "48784954e7ab2734c0720bac98a94b9f8733868c3458f3a5af01a3012955cf3f"
    sha256 cellar: :any, x86_64_linux: "2667664f10a972e81ead5439dcd215894e86f14ca6bda2ea7e60ff9a8c0f8950"
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
