# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.7.tar.gz"
  sha256 "4ad67ca56d1e1db0a71151dd39d33021a7704caebe4278c39ccc3907860fa584"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.7"
    sha256 cellar: :any, arm64_linux: "0f6eea9144e08751264ca3d33e3ed6e27570e6d254318bf979066479dcec5823"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2348c9cdff829c75099320d6ef5fa0e13dc57e4082494faacbd695b9f29e16f9"
    sha256 cellar: :any, x86_64_linux: "f9e18987bcb93d90249a7672a672c4bd4b872fdb8a9cb552fb40d74227dde09f"
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
