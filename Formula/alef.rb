# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.113.1.tar.gz"
  sha256 "dcd32222f23ab786ed59c8ec28291e024c4de471b565d6f88396045f9f8fab19"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.113.0"
    sha256 cellar: :any, arm64_linux: "f9c60f30da379104f00c09681dd16e9c46e6e9125ecb9a27bf97a2d4e859840b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "af488cbfbf68fe7441207182cfad9bb8ccbe7a3b62161c00ab99e0ca73714d8c"
    sha256 cellar: :any, x86_64_linux: "23567b42770819776cd6da7ca0dd2a4bfb184d2591cd5ae221986d46e42d621b"
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
