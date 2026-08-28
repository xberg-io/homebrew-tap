# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.73.0.tar.gz"
  sha256 "41a7d4f04fa2c285b5308e248c02e6fab625a0626b984a6fca392708f59490e2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.72.0"
    sha256 cellar: :any, arm64_linux: "2edf91f3f0b253cdb09d12e2c9bebc6ed4487e8a1e680156c619eba34405f752"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c3d3a0f7894bdde2eb8b9a52c9040a6780a19a29477f028e1ebf46870153a014"
    sha256 cellar: :any_skip_relocation, sequoia: "0b69e5e0964816e966e0255522aa79ccfbfee1d786c9af7f5ea11a65f585a1b2"
    sha256 cellar: :any, x86_64_linux: "4fecc452a555bf26d9c2f4f393ba1051d1324ea03c753e65ecd244bab0a1f9fa"
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
