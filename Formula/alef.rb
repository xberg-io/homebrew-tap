# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.109.0.tar.gz"
  sha256 "c101fd49058679598549ce8e52223d08ba270d4f6956a85862643ccf7f988f28"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.109.0"
    sha256 cellar: :any, arm64_linux: "9867bbf3514f61c101919910ef15ccc787cf6cc09a46919ebbddcc24f1acdf7b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "cd53ea5517411432062143695745cfd2d80f97070abe581183da7b0c6167d8ba"
    sha256 cellar: :any, x86_64_linux: "762904365ca88889b0aa27675ef12f93b5e711d84e4dd43ed05bbe512c7108d4"
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
