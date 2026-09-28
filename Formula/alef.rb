# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.0.tar.gz"
  sha256 "3cb13329a4bfef0be2d7a8dded8ae42621c26f42b5eadde0dc9414d2f391ec6e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.102.0"
    sha256 cellar: :any, arm64_linux: "e4b01278df0600d2aa29b038539788b88b3a385afe54cc75b1c7eba087baf531"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "91df7adfb1c7abb005e6a1a52fd6ff085466216a6f5d1ca51d595aeb82956946"
    sha256 cellar: :any, x86_64_linux: "9903cb82938b4bca19ae556064a161fc45af89e1ebc2a5d72248f8a5a8df5ada"
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
