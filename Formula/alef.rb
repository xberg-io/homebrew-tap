# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.86.0.tar.gz"
  sha256 "e565bd1a47a83756b9e497269a9afc150db8d2121ad794b8326523a03fd51917"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.21"
    sha256 cellar: :any, arm64_linux: "a065a3c60b6f2db4af3cc8e0fb155eb28b7c3aa5181aa3d0582fe197b08fb9c5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0d81d4e02ec57ba1afe068c150d25c47125c4a1adf4a70345974d46fde04326d"
    sha256 cellar: :any, x86_64_linux: "f906259644d07ffdcc3b4595d2aaba1e8ec6ff27a82a0557205e9193697aacff"
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
