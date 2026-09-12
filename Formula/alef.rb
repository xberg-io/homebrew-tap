# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.20.tar.gz"
  sha256 "479afcabbd44acf2cbcf9e65b3acc123c455d768c0155e4af3dff05b19a8036f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.19"
    sha256 cellar: :any, arm64_linux: "2f9c7432a48e9692299f402536515481c0ee89a5a71b0a764e3eff3a3c2460c4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f48aafc6ce4a29efca06c25f9dfe9db7c406e9320676012a95063427b40109e1"
    sha256 cellar: :any, x86_64_linux: "40e275d51df5f0841607b23ef2f4ce308c139972a180598054208deebb2e2a8a"
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
