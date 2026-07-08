# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.34.1.tar.gz"
  sha256 "e586003cae4d548b71365e776194b3bd862d3b6af2134962729081d0378d9729"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.34.1"
    sha256 cellar: :any, arm64_linux: "ce4f8e00e81deecfe3b093f83fc7f66836eab445f91ff1cdd0c1dc10b94dbb9a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "210be7a57dcab1f4181f9bce6b93050858eaffbb7482d825750d45489ec31dc4"
    sha256 cellar: :any_skip_relocation, sequoia: "54a6891ad9297451870cb4b094b8841788f12f0f02e62c7408c55d8161715912"
    sha256 cellar: :any, x86_64_linux: "9d5222bff721504b197ff8f1d96f952eed7a0d7c9d31975107b16a81f1744363"
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
