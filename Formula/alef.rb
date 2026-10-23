# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.113.1.tar.gz"
  sha256 "dcd32222f23ab786ed59c8ec28291e024c4de471b565d6f88396045f9f8fab19"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.113.1"
    sha256 cellar: :any, arm64_linux: "76ba712a50296193780dff0267adb98889f6aab623a40efa1c4c07d1a4fa6862"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0218f94404ced78ea309e14433d7f772644d46038068afe6b34bc4e3545cc249"
    sha256 cellar: :any, x86_64_linux: "1467c9321a0bddcd94824f915e19269ecbd37a48a6d6f45bafecfa5f8d1f6068"
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
