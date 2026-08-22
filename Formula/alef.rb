# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.63.1.tar.gz"
  sha256 "a25d877e4e9229a0acec099608fdfce9410c58a1b69c7740381ad0f88091359f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.63.0"
    sha256 cellar: :any, arm64_linux: "34075f6c7317f4261e1f9a1d19022f990d5376a454c1d228de4e22039c6824a9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "cf247986d7ef2c13a8d72ad3a1c811caefb88aa949d3a5319eecd37dfd33290b"
    sha256 cellar: :any_skip_relocation, sequoia: "baba0f3c5dd6fe83134925580cecfa146745936b1018e592efb2c455dd3d1e1e"
    sha256 cellar: :any, x86_64_linux: "87ea4dfaa8f3e18b4c4951cd207360c06f5e2872998835edb1b64cb6495e8191"
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
