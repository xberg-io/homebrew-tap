# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.13.tar.gz"
  sha256 "606bb6d45c68b7f35d3e601b149f485afe4d2f2d60b77d7604478f772f1ae128"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.11"
    sha256 cellar: :any, arm64_linux: "a006e8859c4a50e89374755b2c25284c7a6a46479ff5360c4819caf4a231abb1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c1551924ed178fd4b18f30ac6170537d0fc8f5351f7db97b0735f5f257fc5a9e"
    sha256 cellar: :any, x86_64_linux: "03f9dbc1729a7fe6aa3503984e2c81c398f8ed8b3a02a621d7ba34480021541e"
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
