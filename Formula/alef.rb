# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.0.tar.gz"
  sha256 "59d06a62d74abbd7fa6a412f900a54b0595c52c851cca025f0af3d743c697e82"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.61.1"
    sha256 cellar: :any, arm64_linux: "435fab054b69e5e8bf8569847b541f9ee57ac416733717e6343c35abe88955e2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4c6de76b0903d7c8fb1cf80b11c265dbe5755c874769d3551c942d7e6ceef04c"
    sha256 cellar: :any_skip_relocation, sequoia: "3590a782c5089d36639ed78b8b01010eb092c0ada7e584ef7d4b4b3348158726"
    sha256 cellar: :any, x86_64_linux: "cd2860c710624b479d0d799c240de2149f6d3bf989dcb782b8bee8be527426b1"
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
