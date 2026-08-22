# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.66.0.tar.gz"
  sha256 "70c1bf124bd140d781a0697ae39ddd7850d2df67d31b1a1985cc6e80f2773ead"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.66.0"
    sha256 cellar: :any, arm64_linux: "e447e493b575cf09f5338f982ca2d79391e30e8906288d434652f4b2517f35c4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b8625b2d956031ad28a9e79b3a569914075bd023c4d0c470721f4298b26d635b"
    sha256 cellar: :any_skip_relocation, sequoia: "b0a9acf47ea1630253838409858422247e4f5fd5049c0486c836bb3e58342508"
    sha256 cellar: :any, x86_64_linux: "83c5f48c9efabb306e327ff37f3c362a563e543cb20fa34f20969eada01aa8ad"
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
