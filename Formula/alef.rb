# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.10.tar.gz"
  sha256 "4f31e8392dad60c6111a41f2d47db19d34c21d9622da08eb7dac3391e9b08cf7"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.10"
    sha256 cellar: :any, arm64_linux: "6702a36c13fcedf67439f44ecd119dd86e3ef0dc390736f2c6e8b06972fe75ce"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "493e1d3918dcd883acdea1e0df8ed1c677466a5bcec17357e9618f8be227eb59"
    sha256 cellar: :any, x86_64_linux: "b53a26797cb1e87581a1173ac600323a3f2c8f1d4d03413c427af70188cdd20d"
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
