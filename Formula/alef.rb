# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.109.6.tar.gz"
  sha256 "fc2099b798b25d6731de30bdcc62b19dc41afec109bdccf99b4e965bb6b1b733"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.109.4"
    sha256 cellar: :any, arm64_linux: "966ca1df3a224d978803109572d9e82e91c60260c742d7ed3180d98ae1f593a0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3c46ad5ab95637de5233faa5b57598837743c4d9b7617cc812aa77ccc38e0ed6"
    sha256 cellar: :any, x86_64_linux: "a820fbe798d6c0b0eb80652e191f5312840a4a8e8b8ad1fff9f4b839946174d2"
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
