# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.6.tar.gz"
  sha256 "84c500bf9ecd2a7575ffbe6a9c5ee2e4766e90e660989a944918b83971e90632"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.6"
    sha256 cellar: :any, arm64_linux: "2d5abe1ffef94c006f39d601ee2819f257c183464e37422a4657555e589a4416"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a14258b68e0a592f0c72f13ab6ad65e71552f60737e9478dca7d5f3586dc3a13"
    sha256 cellar: :any, x86_64_linux: "94482c45e454fe51653d40defa3f33b91581068f9a6e70edcb784e4cc4b7315a"
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
