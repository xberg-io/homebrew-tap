# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.89.0.tar.gz"
  sha256 "b281546e7aec605cdcec0330f5940121d69215f1498a55b5b96387389fcaebfd"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.88.0"
    sha256 cellar: :any, arm64_linux: "fc167625a305f01e99ea4f57b040bd2923b5e583af32ec3fd3365200a10f1b9f"
    sha256 cellar: :any, x86_64_linux: "affe0814bb90f42e53d6f3471969984fec96587266ac7f7ad36d14fb15b809a0"
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
