# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.71.0.tar.gz"
  sha256 "c09f0b1b68713d1b34db642b6505e2866e1196d612825a83d47b1feeef7d34ae"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.70.0"
    sha256 cellar: :any, arm64_linux: "7281f037644c3174904cae4d9343f0b8ea7f1347a43ca1b2946c45d651b63911"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9388140f3b4bbb972d50923fc4da96d616e1962039ea118cca42f27ed0539d8c"
    sha256 cellar: :any_skip_relocation, sequoia: "ab646cfbce559d2737e692dd26bc402af2d1a1b3460e01e7efe33b1f855b614c"
    sha256 cellar: :any, x86_64_linux: "3a6c371db86e6fff32dbf36fad91752fd63861f6a40e4ebd8dc20cc3dca77e32"
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
