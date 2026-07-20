# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.38.4.tar.gz"
  sha256 "7cc82cd4213086061aa2a0bb9b70cba3a43dfd84a0f8a4613ee206309d51af10"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.34.6"
    sha256 cellar: :any, arm64_linux: "6d15f1b452bccbb1acbe35e25ab762317aa4f4280a1194b9099c1aa671029cba"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1f25330b4bfa6b503e6b85a55ef0b928486916fff0b441df3b6d132353626211"
    sha256 cellar: :any_skip_relocation, sequoia: "e0a0665f18fb06c6872ecada60fca3775d08c510f33c7dcd07f55d31b72211fc"
    sha256 cellar: :any, x86_64_linux: "ce93f7664e7159375163c42a8a20f58605fc22996f730cc636bf7388ffc0a1d3"
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
