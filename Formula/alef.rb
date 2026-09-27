# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.98.0.tar.gz"
  sha256 "19641bd421637f4ad3b06b5b522b98a4ae4a5d844f42840d3a0cba4f6a82d0a7"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.98.0"
    sha256 cellar: :any, arm64_linux: "f332514f7470013477f9cf048099a9d8491880a1b3d5bae610721f11502d2abc"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f2bfd7221db1ecd39f09221d81e41634e9424443178fbcf1b2e99b792a2f7a23"
    sha256 cellar: :any, x86_64_linux: "24cd30ac1e96bb7644e1d8207033dd7dbc5c302b08487353f9581dd684d8f1a1"
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
