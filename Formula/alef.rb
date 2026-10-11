# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.109.6.tar.gz"
  sha256 "fc2099b798b25d6731de30bdcc62b19dc41afec109bdccf99b4e965bb6b1b733"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.109.6"
    sha256 cellar: :any, arm64_linux: "f040ce88d685ee3c044b681cecc860d7e614a05df6ec2c5b513fb2b161fd0d41"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2c8fcaee2b284fc7971f34ba81d625c8deb3a06005e4fb698d32827309ff31aa"
    sha256 cellar: :any, x86_64_linux: "798eccf231bb963e8e64f0a06472c293bd9d6a2b7006fefdc519b8926c82e561"
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
