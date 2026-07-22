# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.42.1.tar.gz"
  sha256 "afffc907b3c9bd29b72b73d636a148398e62a570e0f526ce118966e78acdfe85"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.42.0"
    sha256 cellar: :any, arm64_linux: "cf8551f0357d26d63f613f1df69f1a5ae09bb36fc1c26a4349cbfc1fee94f37a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "10083206dfcb45fbdbac43f09f038982c94bfc5ba9ef5e5aea60e3a6dc388718"
    sha256 cellar: :any_skip_relocation, sequoia: "8b46366f987183cdf9a56eaf0bb901f8e4f1fda2d9a16a54ed6d64480b66c1f8"
    sha256 cellar: :any, x86_64_linux: "80e9b459951dc8f9ae0b135bd39993e7229fe9369f44f3b885e654bfaf122de3"
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
