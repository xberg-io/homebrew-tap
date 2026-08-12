# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.60.1.tar.gz"
  sha256 "8e2e717181c6a3bd0c50a35a0dcbdd5c91babc2c8b4e770972b1efb7c15453e8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.60.1"
    sha256 cellar: :any, arm64_linux: "3fba98c408b0eeabbab004e4eaefde224b478897820c9b6cd15b1b2b8a488163"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2a55f5a85774e323d891e9e3832bf32034efd0a29aeac4f9b6af505cdad18fc3"
    sha256 cellar: :any_skip_relocation, sequoia: "8de82e1791fbb908af2f16f98f106ed0f193f220ad36e22aee25ff6f93eebc64"
    sha256 cellar: :any, x86_64_linux: "0565f21d1f16fb865cb8605535245bd858185d3515920e513e386a81ba386c41"
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
