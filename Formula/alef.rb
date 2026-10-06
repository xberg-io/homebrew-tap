# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.106.0.tar.gz"
  sha256 "d7b271ecc039d45aadde44a32bfa29f0d7d6a0db95d41cfd598f8fa148710957"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.105.0"
    sha256 cellar: :any, arm64_linux: "41d8fe053bcb930a0c1d2e6ad42732c340b577e5afc197e4a5c58f4842f531b0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b3640db0538bafe1ea5187e663a2c61a8879c20adf9a6dd8e457f05f031736e0"
    sha256 cellar: :any, x86_64_linux: "fb87f9d150f1b30b6093872e9995b6a8cf381a0cf4023ebd0a7f84d5fd430150"
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
