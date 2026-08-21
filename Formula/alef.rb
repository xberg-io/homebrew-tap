# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.6.tar.gz"
  sha256 "d532518b28b5e1b4e246ff0cd4fac61ffac41b1847590ccf009920d0a2961243"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.6"
    sha256 cellar: :any, arm64_linux: "83e0ff7779257f2b2cd50048174d838d34e8c49e3975622479b20470111eebb0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "633b0b1bbf550b276936bec0856f220cdf7a02f4e78eee1dcc49592ea9ad52dd"
    sha256 cellar: :any_skip_relocation, sequoia: "92da2a2db2b19d1b581787247a9657182bdbcaba7d3c243c3b02f60319bef584"
    sha256 cellar: :any, x86_64_linux: "311e5de88fbb5677d6820a511ceeba9bd3c3addc94c6a13ef0bb6cf963a29e3c"
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
