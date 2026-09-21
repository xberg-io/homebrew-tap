# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.95.0.tar.gz"
  sha256 "ee5e9a3aa0a45d2bcad7ee3fb4d7cc3c6b3882d3bd2dba6b872b185d9f07b146"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.95.0"
    sha256 cellar: :any, arm64_linux: "b89b76c28630fb73b6e33f0ade5d26f76ce71dab723a4246c6bc1a44d0cb72d2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4b66dce996eb74b3567c225c4a87b746abbe7ef93b27ad0eb56588df1ae6afb2"
    sha256 cellar: :any, x86_64_linux: "539126e9574acf7bf5fb9b9cb6470bb71f840f094a7a57473af0761541ee6af6"
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
