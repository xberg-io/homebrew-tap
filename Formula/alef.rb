# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.78.0.tar.gz"
  sha256 "5dfd952ef4df358e4ecfc0871bd3de96c591e922c23bb57dbd7fcb60bcfa07f9"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.77.0"
    sha256 cellar: :any, arm64_linux: "b7f4b9648213d2b58e77b7cc582c10b5e12e1c256db1c15df6c97172cc7d4a12"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2b3a7ea01882de5ea7e07a6728bd01c9fdd579175dc19e4ddcbf73b0efaf58da"
    sha256 cellar: :any_skip_relocation, sequoia: "c926cb0af06cf3de7d1b0ac8962c311a14813aed374b98f9cae9b38c8a140e2a"
    sha256 cellar: :any, x86_64_linux: "48308375172d9460c8f3eec52ed81719cab34758b638285d49f6745cef49631d"
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
