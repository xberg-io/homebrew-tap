# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.84.2.tar.gz"
  sha256 "64451d04f5476b894224e4cd376319ca5508d00a553b579137c21ba77b74d7c6"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.84.2"
    sha256 cellar: :any, arm64_linux: "e061ab9e3233bd519f9d51902e4bdf67db494ce22a4d1243783c7daebb28787c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0cdd1fe5d4d514ea62ed36d8201b23fe8ed2c189a3246303e3b14f3e2a345ed9"
    sha256 cellar: :any, x86_64_linux: "f45498c4539bc637cfce5b16c63aee9908ee6348a78ee4c78ca8544df59ad052"
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
