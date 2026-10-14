# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.10.tar.gz"
  sha256 "282531c44721ece8cb714ec2e08d43c9fddca21592e085e058ececf2557ff684"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.9"
    sha256 cellar: :any, arm64_linux: "e08d76520eb1f9a88b1ace4e1f7870570f102ac49d46ebb43f1d50fc67b7a232"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4b2a996e1a9717d4af8017a521b00a8ffa97a459eab8dfae7a579088fa3b5057"
    sha256 cellar: :any, x86_64_linux: "099458b5e9694041354d36fe900d904a84e320c75c1fdc8b7fb1885ac045be49"
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
