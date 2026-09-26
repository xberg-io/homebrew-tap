# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.97.0.tar.gz"
  sha256 "1ec7e19d771edb99ea2d4d4ae4d26f885ec6a498655ccfc4b70e4ce4e8be9516"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.97.0"
    sha256 cellar: :any, arm64_linux: "f9fa4228ac34d481d554a0320e9acd6a1c938ef6bce61233ce834957664a49ae"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b956a8b7ec9b52afbb881577b1fb2995ed0b29140287f86e88948712e6258065"
    sha256 cellar: :any, x86_64_linux: "65c9e6fbadf2adc1219a28f39818c9364ae2712699c09eccd5ebc79c5a7134ab"
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
