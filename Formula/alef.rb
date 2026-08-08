# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.58.0.tar.gz"
  sha256 "253644398419a7a30c7942dce0c371ac593881c634daec10e83fcfef6f25a351"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.57.1"
    sha256 cellar: :any, arm64_linux: "bac4592549ec74b7aaaffca5dd3fce48f69bb6851cd1f5cfaef8e4148af31eab"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ede8d58f6786d06118a38cf22546da8ec524a1afff014a3682c451fa4113cff1"
    sha256 cellar: :any_skip_relocation, sequoia: "76341a0b64b16b3c5317a86105943f54b88758741a26330b99999de80a7c9044"
    sha256 cellar: :any, x86_64_linux: "e1ff103e7477b791f0223ef42308f317e163c26c1902b0130d13c3559b0416ea"
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
