# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.82.2.tar.gz"
  sha256 "148381d0ab3267ccc927ffddbb115708dc8d3657bb736920e0d4615f4e066e3f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.82.1"
    sha256 cellar: :any, arm64_linux: "ea4bd612c0e57470e1b9e70bf2c89d836775a114da4ce180f43d2656e4a75ed9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "aa7c35ab20bba0c80a4c9b3cc5fc8b994f3fb022eebb489ecc6dc40cffa521c3"
    sha256 cellar: :any, x86_64_linux: "73b4ee753e5bec9343197dcf07da4892b772cc06f05a17f00f425bffad085424"
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
