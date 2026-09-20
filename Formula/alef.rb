# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.94.0.tar.gz"
  sha256 "0a0c40ab3e3b5622d57212b3becae7153550715078aab7d0e00018c785ac993f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.94.0"
    sha256 cellar: :any, arm64_linux: "d1e3bf6a328aebde7bcb4c4cc6de11207db07c1918411463d3094291f7b93eb8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e140b7e8d6d0b56c8ee328f3f5c788a1b175a1dd87bdeb825090be9db947f4b4"
    sha256 cellar: :any, x86_64_linux: "aa0a31ee82df94e9237aa63042c95cc91b6c34655eebc58bd22762bdd209704a"
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
