# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.86.0.tar.gz"
  sha256 "e565bd1a47a83756b9e497269a9afc150db8d2121ad794b8326523a03fd51917"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.86.0"
    sha256 cellar: :any, arm64_linux: "b3e280255896a26372fc90ce71d2ad0af3922b22964e5e6251b31edb2227b806"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d81a7fec692c4163d905f1f8f66dc2930bdcc9ae60028e0d63de201b9acb9c83"
    sha256 cellar: :any, x86_64_linux: "ad09802eda6cf9cca14521d334d3ba39cbcb37f6a6eb11dbb487e4de69a16c0a"
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
