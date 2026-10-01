# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.3.tar.gz"
  sha256 "00323b8d2e1bb431601cc77f9fa41fe356933a33576b877e9fef674b9eab75a8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.3"
    sha256 cellar: :any, arm64_linux: "3eadd474940c7411996e121f5939160db0d3d5b28cda3170fb156caf46020757"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "21469b0570bbbf43ebed9b0684209378bc436dfcb4575d5046060abf3f9e460d"
    sha256 cellar: :any, x86_64_linux: "3493e61712db282cce257186e388f8068f26d46c18e6a8a6ee17ffa81ae5348b"
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
