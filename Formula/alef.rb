# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.4.tar.gz"
  sha256 "68b4a44ad8f5ba7e40ad0443f7eb6314f7c734fbd4180bd4531a19ad4f74f816"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.3"
    sha256 cellar: :any, arm64_linux: "0524d7850a082784d0a580e836e1ae54f62533bef9c7875c84a0d952f6d85090"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ba250655f7ccaaf68d8ca00749813fae484aba2db2136db6b121b19c180b8473"
    sha256 cellar: :any_skip_relocation, sequoia: "5d7755062eb771a2d9ee75e3dce18d94d5894b63f507e90e389e00e1f445df77"
    sha256 cellar: :any, x86_64_linux: "d78da48dbe69ac801b59a259c740bafde98a6702397949397f6312205396f8d3"
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
