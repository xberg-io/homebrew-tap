# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.107.1.tar.gz"
  sha256 "b438b1623d81aeedf1bd1d70e364efa1539ea0f3ce819a082f3e1d1db2d8e0f3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.1"
    sha256 cellar: :any, arm64_linux: "f1456fd887baa303522edcad648c5ee7c1b1a26c2c6ebde8bb7964d0641c6141"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "20bd5a55943582d3a496c06e79fd7db7ceff345c3a4c53b52bbb8a91a77d8337"
    sha256 cellar: :any, x86_64_linux: "f8c7bd6f29fa8caeda4d29c24b6ac34fa329174b813c9b8223f051175eb754e0"
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
