# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.16.tar.gz"
  sha256 "19a6ae80906496aae034106273f9d5fdcfc4c7dc38ae6b162d41cfea97eac0cb"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.15"
    sha256 cellar: :any, arm64_linux: "d7a607a371088b86cba834520d5543e479a1a47e4d4cd400a7f8727b2df6f1bc"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "161a5616bdc98be6d0f141b2459c5dae88145f1123710cc8a12ba7fce62ee72f"
    sha256 cellar: :any, x86_64_linux: "c023dd49887d01d764efe6c4a5f0bc2f268ec777534fe1e4724acf965c9a35b8"
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
