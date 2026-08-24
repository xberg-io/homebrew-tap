# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.67.5.tar.gz"
  sha256 "91605831edbb502b106171474ae27de540e2c34d9472e335594422ef5a6d4421"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.67.4"
    sha256 cellar: :any, arm64_linux: "37d39faec8abd5980ab3f23225319f5c6b800bde368d0a45360ff8a5dc75bf43"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a79bb08e07d441a02938fb314ffa91f5499ac528b1d7e1d5d947053b82a2ed8c"
    sha256 cellar: :any_skip_relocation, sequoia: "de5168ea9f452b352fbeaa6ca02dd5127c5f5aa2fba92e6933211203643ce77f"
    sha256 cellar: :any, x86_64_linux: "a7f14bda47a86bb753c7ad71fefdf18a437ae48bc6c291723758a85242aecd50"
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
