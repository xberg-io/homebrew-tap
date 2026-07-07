# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.34.0.tar.gz"
  sha256 "fae64ab8817d9872fef27437f09dcd125f41b4c73672bd7869c14958f1f29a30"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.34.0"
    sha256 cellar: :any, arm64_linux: "168c89c9daf97e1fe7ca014a660ebdfde99be826c1b73b77c2352788ef78e754"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "08a98ca257f004cd53a0703db053a04e7571186ee0ec690b50256b02ecab18e7"
    sha256 cellar: :any_skip_relocation, sequoia: "fb7e17fda9928fd487f87f50cdb8191ffa991bcef7110ee7a264e004d3695ef5"
    sha256 cellar: :any, x86_64_linux: "709ea9825c91240619baab6201137a89094ab41f22e8e933cabdd97cc14f2199"
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
