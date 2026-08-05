# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.54.0.tar.gz"
  sha256 "3e2ce40aedb0158fe8c01117d06e57a2890757261bf7902405b1235f84299550"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.53.1"
    sha256 cellar: :any, arm64_linux: "e78d30c536cfa9d8241147e795bea6295d5a2eb665be9a1b06b54d4dc11922db"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b804f33919c7f1e563a394d8f13d547a19b2098b52dd8f3605335c13982922a5"
    sha256 cellar: :any_skip_relocation, sequoia: "53b74e7b25f0b97c08f0207aac017b1b21157f472dfd71142da6c4ade9508826"
    sha256 cellar: :any, x86_64_linux: "37a21a4cb75fae4be18b4743e05f695ee3f2754e704755e09b30937db436a398"
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
