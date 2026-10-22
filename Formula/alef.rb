# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.113.0.tar.gz"
  sha256 "e964d0e440ce89f15796ef678fa3eca760d4257d4599a4ce92191147a5ce0260"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.112.0"
    sha256 cellar: :any, arm64_linux: "ff24207171460f44e1996957f5b5a2821c6707e9f4120aaf952f93851c48573b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7dbf55ecbdfdba48c7ca9ff104af189ffd075b87b43c0bd1eefcdd484d903c65"
    sha256 cellar: :any, x86_64_linux: "7fe1688ff8587494fcd013839df5c60c2e7a49d0ac7565a71c1027fe4b14aa8f"
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
