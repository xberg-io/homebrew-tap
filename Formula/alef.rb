# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.0.tar.gz"
  sha256 "59d06a62d74abbd7fa6a412f900a54b0595c52c851cca025f0af3d743c697e82"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.0"
    sha256 cellar: :any, arm64_linux: "7a551a3a20493b98fd8c555c5b2596a4e806c83d73dbc123b3be7da45c3da43f"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d37105498b579379f18a4171af1cec5aa1657bb985e8664dfb063ca03d59141c"
    sha256 cellar: :any_skip_relocation, sequoia: "d470f4839eff270cb04c6d235e93ab00de83114cdb64c2184106a58ee689fe80"
    sha256 cellar: :any, x86_64_linux: "7e887aff915e3965254da947ed8b9d3ffe87d197976b323e6b8099f042da8147"
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
