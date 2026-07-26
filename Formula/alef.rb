# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.2.tar.gz"
  sha256 "0bc14159260451bf58fb19764b271c6c361f2ff615ea19db6cb5dff12210162e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.1"
    sha256 cellar: :any, arm64_linux: "3410c5ef34b33630397eb48a9c413955991ad987a7771bfd07473a8debfa9fd0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8a99a14ae4ec4c365c3d7908c88aef0b8c58691fa0838c9f10cbc12b73d4a5bc"
    sha256 cellar: :any_skip_relocation, sequoia: "81b924d31c7eca230b74feb8294568b057b3549c8cc6242c2c680202fa5c0348"
    sha256 cellar: :any, x86_64_linux: "11d64e201b6eb55e7a8e8ffee2b6c058c744250b567c554ef42ff1f5f37a1665"
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
