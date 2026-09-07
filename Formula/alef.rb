# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.1.tar.gz"
  sha256 "a665bfda05d8dc70d3a524ac1dfe2ed8bf08742cd3e5b810435a444b95cfe2f3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.0"
    sha256 cellar: :any, arm64_linux: "962d944a8a778a6fdad1d0cfd40a95cb4a4ecf9a9fad9ed0cf47a8163da1a747"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "de3d8b0e5eabdd41d9a6e3090bfa3d09078e0e3d9987fc8b835cd283f6425d42"
    sha256 cellar: :any, x86_64_linux: "d7e65648647fe5dad02bfa393d906a870f18d86d81cc20ed1e19403cd6234844"
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
