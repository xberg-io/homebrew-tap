# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.7.tar.gz"
  sha256 "22517346bb5ff6939afa70dd9d1ec1e01986cee7cbcd5e85c2591997b764acd0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.6"
    sha256 cellar: :any, arm64_linux: "b9a5bbeb1545dde342b46699ae2f64785b6a565a62557d95d9a22a728197344c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7587e518e1e8078159bb933417ade83f70bb7c1db3c891a95a771452e7566127"
    sha256 cellar: :any, x86_64_linux: "c3fb2cf83883821c814fb8c35e8645a6e1ea6d831cfeefe08b291d3efb8b3c5a"
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
