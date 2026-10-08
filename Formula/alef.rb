# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.107.5.tar.gz"
  sha256 "e0160026aa640b621420e337a50a3c76346d505faa8faa303e8f233e5fc5126d"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.5"
    sha256 cellar: :any, arm64_linux: "b1a8f9b860ebe3dfbd35a5e88b0f9898772b9b94560164abefef4fb17ce7d9af"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5718da8562c8a6047a82aea225cc94aeba3ce597bc5c66a15efc50af0376aa8d"
    sha256 cellar: :any, x86_64_linux: "656a382fe466ca514093f18c6f3c659b8ae3765a62fbd86b1b1662b0692173a6"
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
