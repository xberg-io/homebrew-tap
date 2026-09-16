# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.90.0.tar.gz"
  sha256 "53fe8d80b68ec804311c7cb73fb7fbb03496a0d6d4f2cb4688e49f7d4110be07"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.89.0"
    sha256 cellar: :any, arm64_linux: "69b0af02ea22ed853a13f18689d4ddfef77f24ed4ff633cf694fcedc4bca92d3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9c38677c9a105b503a5e0f0e5b69cb3fc79fefb685b950d030068e1bdbddf437"
    sha256 cellar: :any, x86_64_linux: "992758e1de3a9303f7b2a34217209b08d303a20bf30704a3f7aa057aea735381"
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
