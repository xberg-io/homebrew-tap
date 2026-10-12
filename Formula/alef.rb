# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.1.tar.gz"
  sha256 "cb51621138091afa4d4c71482962af25db752aaec5272673c6629e147c286f75"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.0"
    sha256 cellar: :any, arm64_linux: "a92dacc86cd976d8e2a346c5f2903c316c66a59e2105b95b873436a0b84bd8e2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4522d1973bae31d4de62f3250bb6206c62a99ec0320d5b0c45a3d27833dd797d"
    sha256 cellar: :any, x86_64_linux: "2c4c25f21cd5abf450f7a1e7d8fa7ac4746b6a6a293e9998f72f940b9347cb3f"
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
