# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.5.tar.gz"
  sha256 "4aa452a0edf821e0057e6892c425958a9f9cc4ca6db03f0cf8d6016adaed1959"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.4"
    sha256 cellar: :any, arm64_linux: "f9f2dcfb060917ac84adc848d1307a33d7432b839d3be42bf86204da4dac8b17"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a6fdc977132e6bdd0483bbac082179a06c013be2095234bd8a0f12de1e216b46"
    sha256 cellar: :any, x86_64_linux: "5b2164bfcdbd055cf715a4c0cc3278c9271921a240422da2ec53b74514807863"
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
