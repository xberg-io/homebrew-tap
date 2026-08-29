# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.74.0.tar.gz"
  sha256 "3089be6e60eec39e899a23234fb2346a72c1ac9860b7a49255f96d9a6f8d67d2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.74.0"
    sha256 cellar: :any, arm64_linux: "b80efff614a284a32f94d607f55ffcfec4e2cbce73049062b8c04b104b12f7d0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a331a6ee370e42cd31cb89c5445c0aaec0a15488d7b07df12ca7e356ac423586"
    sha256 cellar: :any_skip_relocation, sequoia: "422b8768601119f035871b6b30cf79b4e6a59ba1a1e24a60a261f90775a6a431"
    sha256 cellar: :any, x86_64_linux: "0b15663d29ba55265991030fe25bc74c99712b48e6bb275fdd1f70a202a7cce9"
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
