# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.132.6.tar.gz"
  sha256 "25c9f3a7502afbc00ea7bc1db2b57f00d44692018d3e5f01e04453bcda8092b8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.132.6"
    sha256 cellar: :any, arm64_linux: "52b8fed60b809f796b4f04a439299d9e2114996f8e3f4ec9e78ccd0c8ed99cba"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f3694f61ac4be61763452a0735e214de28be6a9e34917f534aacc9fef5507aba"
    sha256 cellar: :any, x86_64_linux: "b6a36f83332d82ea4f04b74fbafed0d9d2cec4e7686cd2dd95b956c1cffb11c2"
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
