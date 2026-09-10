# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.12.tar.gz"
  sha256 "8a4d23b8e83b46bf0ed0fa48b380f8d1786322d28c646a038f24b0dd43accd90"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.12"
    sha256 cellar: :any, arm64_linux: "d4afbdec4757f4c187888edc217ec89ab3db186cdd383187adcbaeedb725f7d2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9b78628d46706dc8b74077a45aab5ef21f6654c385d007306209687efe523945"
    sha256 cellar: :any, x86_64_linux: "e2cf40cec23c41275c3d977c6c37572cfc829b4b40db529dcc42c5ca29869381"
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
