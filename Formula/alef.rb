# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.18.tar.gz"
  sha256 "b0145a4096da18a8135f93e320add328c85631515842b640672904887f613a63"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.17"
    sha256 cellar: :any, arm64_linux: "a370ef4855673690561e30fd966d9ce02eb58c668615cb51900749a0ba465aea"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "410b7f5efed762f9671cee38abfe33954d2b0bc96edd06bdc542f27e64a41bd2"
    sha256 cellar: :any, x86_64_linux: "fdebeb4da7a4b662ecb190ee158e325676e392ad6bf1305ca5cc3499411d4591"
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
