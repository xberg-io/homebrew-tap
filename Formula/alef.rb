# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.33.0.tar.gz"
  sha256 "a64129ff27997a870a8aa488f915974320c75c2573b43fcc2069261c2f667ac0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.33.0"
    sha256 cellar: :any, arm64_linux: "eaa18d5c67ba8bdf62566c7c16f3813f33d3cacf897c1a576bae6d505a94b8b0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "01d22a9a3627f70117c986cc0e8824d6590968679d2ec17f8db46f96d3096d36"
    sha256 cellar: :any_skip_relocation, sequoia: "599d96a1d6175f624b73bdde9aa4e847ffaf9392513869bb49125e62bfcc62af"
    sha256 cellar: :any, x86_64_linux: "ac25e4d721040d777260b555949a6ce9d21e0f3ef20a7b2af6923d3373254a38"
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
