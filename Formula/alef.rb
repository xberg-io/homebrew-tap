# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.56.0.tar.gz"
  sha256 "2cb20fd3af74977da73f022f99a69fe9974fc836d1e30f1c30ba155dce5faa7c"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.56.0"
    sha256 cellar: :any, arm64_linux: "b60205516abd673b06aebd8c81690e09d033893f2c4f6ca380df6e673eef6ce3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f100fe8f1424b5f00129776f45fff05d1bb83e48f246682f3d0a04863c2184c2"
    sha256 cellar: :any_skip_relocation, sequoia: "94f1661aaf1307de0399c8210a06157a1075705a17aaae16d1d33be0a71ddb64"
    sha256 cellar: :any, x86_64_linux: "6a271c35b09609f99d0611c14fd4abf9b884e17be5257e37707471dc6dd5a70e"
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
