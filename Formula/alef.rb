# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.101.0.tar.gz"
  sha256 "b52ef6df01ec4295c07c74cfb4ea895c47fb264d5a2fe386baa17a4a22b5a718"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.100.0"
    sha256 cellar: :any, arm64_linux: "ea0b01e243d1c842bc998c7d3bd4c87c21b9eea1c5c2bfda96a82ce4b9186ec0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d35c8deef21dab00566f2e84cafd5eac2d17e855fc9f1f4dfc4ca3c4dd2beb5b"
    sha256 cellar: :any, x86_64_linux: "8cf48397655cdfb0c4b333de9e4dceee0363aca4bc9ba81dc5708d2fc21f7a7c"
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
