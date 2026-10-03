# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.10.tar.gz"
  sha256 "cf37cb177b6654b833f095da2495aacfe0d56971ac5740dab1d02a729e929dc8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.10"
    sha256 cellar: :any, arm64_linux: "215b672837aec7950d915713d044019b9b56b6138d7c3417fef0ab14f9d2753c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d4bc62e427d3448ca933faa2e2dfdd5bfff392db4c595eb13959e4d436117712"
    sha256 cellar: :any, x86_64_linux: "7c72ec5627911d8c878e1a2620b4e34d2cbde774590c1532bd8c4e00ef3f7e0d"
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
