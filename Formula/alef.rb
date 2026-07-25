# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.47.0.tar.gz"
  sha256 "df6f8927c4bc2fab49180aefca01fd4c7ad6f81b5006a1cfede95d5b4b201fca"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.45.0"
    sha256 cellar: :any, arm64_linux: "b8040d0dfb8b7333678586401581e2b6da1918ff2cbfe179d3c0ffc98f6aa995"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "217cc973e5b778482f1907b524ed2bb66e90221702b1b2d421edefcb3ef148d8"
    sha256 cellar: :any_skip_relocation, sequoia: "99a0119933c8593e18bab8ea4bcea6ca426ee56a70458ba094a714f7d1fb80bf"
    sha256 cellar: :any, x86_64_linux: "962301a24e0f6ef14a592db5f0e06c718b2537470f19d771cd86020133cd63ec"
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
