# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.9.tar.gz"
  sha256 "68d8f9fab398ee8650605b2cd21280f5ef6ba774f14e3bffc4090ac508933cfc"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.8"
    sha256 cellar: :any, arm64_linux: "eac0899f72be36bbecf2ceadaad5f1c4cfe250152a53282276c5d713befd9f67"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "69eff642ebd2098734875d5e98166bd40491c1327ea09896fbecdf56aa8774e5"
    sha256 cellar: :any_skip_relocation, sequoia: "6a3916337a34393e64482e2b8b5d5f8516cbcabd0313c61f8e07ac4bf2ef6c21"
    sha256 cellar: :any, x86_64_linux: "140620ab180179a124572d167501ad8398bfdc7c01f5c80ce480952aa111edee"
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
