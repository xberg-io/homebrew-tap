# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.44.0.tar.gz"
  sha256 "1873f927f4fbcd06fb0240743c39dbdbeb9b6a5998460a2e0e0e1172d887caf1"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.44.0"
    sha256 cellar: :any, arm64_linux: "bd7457c4326e194895f87a31cafe21d767d9453e615061b7c442cbf31028607b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5e7192f74ae46412954966a5f59fe4ed31b75d47a72d555b445ebc0fe65b8d17"
    sha256 cellar: :any_skip_relocation, sequoia: "e592209ebfa7cc4be712ba96ebf7eb2617fac0b141ae938fb2b2e23354126f09"
    sha256 cellar: :any, x86_64_linux: "bbb69e79f4f4032721bf327a85fac8ad891f53ed186615e17363eee958f25b9c"
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
