# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.91.4.tar.gz"
  sha256 "aff6f6925cea22ce016c3e6c5ebff9d023b9c7dd34a162af1ef5b4124d92239b"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.91.4"
    sha256 cellar: :any, arm64_linux: "262a0861ebadaf7a35ade7ff3d9a7178bf5e9f180ca0bdb0b939015533f167ef"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5e3cd7f5b8355acb9002fe7ac52bebb4210bc521b97b36c640a4ad348dbb0504"
    sha256 cellar: :any, x86_64_linux: "12499ed64442d82612971736a807bfdd3443661263b4ec303dacdd53fb95aef6"
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
