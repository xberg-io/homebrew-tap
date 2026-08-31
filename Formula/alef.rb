# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.79.3.tar.gz"
  sha256 "8d340065e4c3a002d47458073b04c5fd1358db5932bf1bc2c8a02d71c6f4c363"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.79.2"
    sha256 cellar: :any, arm64_linux: "68a5e69fa4ac0812facbcb88ed1d39d35838ec6feb8115cc0b287d19092ca39d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0d07c0dec63eb21123960ad76b6280e65deae0efd403fcef76d1e574d6d9a028"
    sha256 cellar: :any_skip_relocation, sequoia: "c1b2172a1e577a8230e6cb1fa483b6888735ac0095dc1f480377da7f5add6a6d"
    sha256 cellar: :any, x86_64_linux: "f7d7f88f21ef99e67ce35443952d5e672d7f4ffd1c416eb7151e8b9686aef248"
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
