# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.109.1.tar.gz"
  sha256 "9f181bb5c09985160675ccd101c000c937ed7b5ba9435191f950e945b4112e56"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.109.1"
    sha256 cellar: :any, arm64_linux: "bb6bd227d6c4a9f49df48db5a746cbf288572993ea7a7c87f50d0013f5e93835"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e9eff8b530e9319ab8328ff43a3d4b2bc556bd04081af6c3d683e2fa39c02353"
    sha256 cellar: :any, x86_64_linux: "b92903f9fb08ed5fef7f56753f66b5666d25d22b97716500af5c1eb4ca46b58a"
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
