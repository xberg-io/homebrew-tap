# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.5.tar.gz"
  sha256 "4aa452a0edf821e0057e6892c425958a9f9cc4ca6db03f0cf8d6016adaed1959"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.5"
    sha256 cellar: :any, arm64_linux: "b2716ee37b3daed9c5031bf77068fed279d94ba9b849133008711261d2c7ebfb"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "690c9ed810cfa891dd0caa6b78c42244ee7211e9289284eeb70b70a3233f7b57"
    sha256 cellar: :any, x86_64_linux: "33a3d9aeed581409d103bc8ab8c63d5419ec9e4680d75800fa90ff6aa9fb70a4"
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
