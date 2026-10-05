# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.104.2.tar.gz"
  sha256 "2dd4de2b4f5d559e9709fe33f28c7381b98a4983c83f418c53928c4249541d11"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.104.1"
    sha256 cellar: :any, arm64_linux: "99950d98c476a8e2d8e61e4c768d2df0f50e7652c6939d7044ca0bf5386c3694"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8b4e556363cbb047ddfdf61604c18d87e363c04384a698828a8ee6944482556b"
    sha256 cellar: :any, x86_64_linux: "e269186a524e4c3084aaf90451e58f78449c4c64a9295e2a373014c6a99d3056"
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
