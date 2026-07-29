# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.7.tar.gz"
  sha256 "d635f3f3799c3c900211d54c3a0fd3f33140a6372fac1a51fd1199ede9b6e63f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.6"
    sha256 cellar: :any, arm64_linux: "ea2a8d0442c23f0de8acba3181db00edd062d8d5a24111c3a4c49255119d1ecc"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1a43051b333e3b2b9392bb06f5f7868f93198e70defc82518a13444ea31844af"
    sha256 cellar: :any_skip_relocation, sequoia: "ddb49b100c16fccb4aa49e67471ece5275606bd0216b0d23faaffa728eb3739f"
    sha256 cellar: :any, x86_64_linux: "166dc17efbb6f6786e95224cc326b5487c231ec62e97e12c22946ef897a60af0"
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
