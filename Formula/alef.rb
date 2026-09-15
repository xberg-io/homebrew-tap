# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.89.0.tar.gz"
  sha256 "b281546e7aec605cdcec0330f5940121d69215f1498a55b5b96387389fcaebfd"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.89.0"
    sha256 cellar: :any, arm64_linux: "76d4bcbd4117780c01e795d7ffc0fa5605c915a86a05c0251a08181f6cfa8c98"
    sha256 cellar: :any, x86_64_linux: "be74a17d333a840c12e72c1af03039b14a8c31fd08c8dbf0a342a9b2abe129b5"
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
