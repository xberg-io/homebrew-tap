# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.0.tar.gz"
  sha256 "3cb13329a4bfef0be2d7a8dded8ae42621c26f42b5eadde0dc9414d2f391ec6e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.0"
    sha256 cellar: :any, arm64_linux: "0dfa92b6ff5da27874f758c116f93ca7db38c164f492bd4c4c32b35c00313f0c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "670e932f3d46cccb87e1657d991158aa260e2168a4476dcdd8b5d0e2af20f693"
    sha256 cellar: :any, x86_64_linux: "ad9f92e72afc4d65d298e8910b8bca9dfa13d437ab2b1070f1f092ebc611f734"
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
