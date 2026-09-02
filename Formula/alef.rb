# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.82.1.tar.gz"
  sha256 "f3199259579a26f535c0cd30501102df419a4ee908a91624ddc6611224bb0d9d"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.82.0"
    sha256 cellar: :any, arm64_linux: "14fb6bf6a9902c42eb37c6b51f5e8e2fcdc949207bc079ddbad6e7e7549044da"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1eebad8f50b4267181bfd73657edfb4927e7bf04376ce7407016ba9f2e269e43"
    sha256 cellar: :any, x86_64_linux: "3ebd516d3859123040366adbd60e684eb84a155d3d497158fb85f434a062a1ef"
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
