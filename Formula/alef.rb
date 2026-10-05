# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.19.tar.gz"
  sha256 "e4face8f55d96a996caab89ac78e58f96575ca1e0e73beadb25015a7960a1240"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.19"
    sha256 cellar: :any, arm64_linux: "0c8c3a84f2b20d67389a06a85bce7bf8983975a85c0f2668bd38694c2e9c0fe7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5de568a289328d3cdb35ffd4e83985122d58bf04f756036ff08461fe4263c212"
    sha256 cellar: :any, x86_64_linux: "ea3cd858571f65fc62fe398239c16143fcb735f19088543e425df9cb3f54710a"
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
