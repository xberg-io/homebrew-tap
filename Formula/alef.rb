# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.107.5.tar.gz"
  sha256 "e0160026aa640b621420e337a50a3c76346d505faa8faa303e8f233e5fc5126d"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.2"
    sha256 cellar: :any, arm64_linux: "14a8e44e4835111f291485598836d78272d25ffa84318933e7c60b81ae03d412"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f46c0cf94c2035af71795d881d0118db2e4022d69813467ab9536745016a038a"
    sha256 cellar: :any, x86_64_linux: "a6e9a6f90cc5ef1606111eb932cc049f454935e41418b15249679c4e1fb47c3a"
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
