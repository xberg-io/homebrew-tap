# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.67.0.tar.gz"
  sha256 "a93eec0a14799b635fa0c0be68ab99dbc22699eec1d29e604369fe409df1622b"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.67.0"
    sha256 cellar: :any, arm64_linux: "cb504723d5ecd4fb934647058d6f11b15bb3383d29388a32e590706ed58f7e09"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "33141b5259668364e11d7da46a12efb8de231b9b9964bf1921ef604e00f0fdc0"
    sha256 cellar: :any_skip_relocation, sequoia: "03bbb4940d7ad0b0345bde0871a071f8c9787c0d04a6b394628fc8b9269ede61"
    sha256 cellar: :any, x86_64_linux: "958b1f733e4de8a50adf98c768a432cf47d34898d55675e531c9af6457145796"
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
