# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.132.8.tar.gz"
  sha256 "9778c308104a247fbaf2b2622d91f9c790ac2482b97b8de4c7a4eabbb79d26fc"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.132.8"
    sha256 cellar: :any, arm64_linux: "d0cfab29020ffb7bb1d9f2a7318fca86dc42da5e1a1ae2045d5bd629b54556f7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "109e03fb3164879e8aafb0b3cc2e538763138715fc7e95c9f2ea01513362a53d"
    sha256 cellar: :any, x86_64_linux: "5aaf7d101089332ae11eef4e17708bddcc51af414fdb0c1b1105b15d89d556b8"
  end

  head "https://github.com/xberg-io/alef.git", branch: "main"

  depends_on "rust" => :build

  def install
    # ~keep Bottles are tagged for macOS 15, the org floor; Homebrew would otherwise target the build host.
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "15.0" if OS.mac?
    system("cargo", "install", *std_cargo_args)
  end

  test do
    system "#{bin}/alef", "--help"
  end
end
