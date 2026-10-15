# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.16.tar.gz"
  sha256 "ea5c7236a8c133a42cc13a92aa031706deb452093d31069a14493bc3aa997c9b"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.16"
    sha256 cellar: :any, arm64_linux: "876539ab55e310780ac8526334e48245aaa6cbcc48d78614d773107ce51e4e13"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "55d88ec908b42b126e9c36a57f1bc7a179380826b170db798b397f86501ed523"
    sha256 cellar: :any, x86_64_linux: "e4e8f6d845617218076684136f0eebfc76a5e043be964cdbb0d0366ca255bd1f"
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
