# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.4.tar.gz"
  sha256 "840926c1c2d698c24881aa4c3200d6ec635b61bf43222c91ef1c4770299969a4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.2"
    sha256 cellar: :any, arm64_linux: "8193702d01c67e5d144749d4beb4e102cbeebe526e15385f0580916b6f7ed9bd"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f624988a18258cfc1c86ac874bb34b5579ad15d58bd0c58a48ac4cbd05d55e35"
    sha256 cellar: :any, x86_64_linux: "2f6f36bc5731bf854f6b46bbc81318344cb80f44953753f7bb3fc73c39d7fcee"
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
