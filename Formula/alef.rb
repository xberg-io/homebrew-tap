# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.11.tar.gz"
  sha256 "99f13dc0e43450f536d8ae0b77b553f7caac40adf8d73b11106e674dd4b35ab7"
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
