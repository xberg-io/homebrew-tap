# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.9.tar.gz"
  sha256 "79412bdbf6fdf8f10d4b94fc4f1ef80eb743c322fe87c7d551aa51cea8908bd8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.8"
    sha256 cellar: :any, arm64_linux: "a50d7ce530377ceac5173955fc98fb69a477ab9d4c9dd7ed4f4526d59376f380"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "18b70073a6e76ccaae5efadd0f45bab1a3b10b34d8352a2308221b2aea9e3c6c"
    sha256 cellar: :any_skip_relocation, sequoia: "fdfb3e751e0cacd20de9a488023bb92d6a4cfb103fa1608f95adb1417d816391"
    sha256 cellar: :any, x86_64_linux: "2b1f694b46cf10c7cc78f74ac399968cedc72ba07fd0af4ff9f2f106ce359a84"
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
