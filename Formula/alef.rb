# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.6.tar.gz"
  sha256 "f3ba32f88ecb7eb583286f1c1f476fc94fa777ed694573cd74836e602649496b"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.5"
    sha256 cellar: :any, arm64_linux: "18c862bb0df2db7ade23bcd8e489423cf1ae08209f6814ebaa37f8a47640b5bf"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7b8e21d8247cf1eca1043a2431567352d3ebb2077734b2c47505a86d906c14cc"
    sha256 cellar: :any, x86_64_linux: "708b708c543f3a5fa79ef6dc56bd2aaecdbb8eb744f670d156bfe644e1da4346"
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
