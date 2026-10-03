# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.11.tar.gz"
  sha256 "cf5f1178f48697e89ca24c3836a058f57f80ca253a94c9e607d69563f79caad8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.11"
    sha256 cellar: :any, arm64_linux: "a7c4e68bdcfe6880c93f5fe2704eeeab8502f2c760bfe101859d0ca60cdad65e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b33478899bff4805aeb24736a0c81fe42dd08e8fbc9fa8bc682d8d18fd3068bf"
    sha256 cellar: :any, x86_64_linux: "b08f6c105d8f6d924e3bc12d193a5d63a6cfeef6734b94242d7358b84cd4c282"
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
