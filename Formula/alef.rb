# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.7.tar.gz"
  sha256 "22517346bb5ff6939afa70dd9d1ec1e01986cee7cbcd5e85c2591997b764acd0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.7"
    sha256 cellar: :any, arm64_linux: "b486026538a8a27994c20ae782c0e7bd9ffb976b7be388e9ab08353fb772058f"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0cb8cfd385cf5e1780fc9e6c4b5a21076b439c0960c915ccd87152e2847c9267"
    sha256 cellar: :any, x86_64_linux: "8ed084581cec3d1db1d755aede11efbdb3220308618e0712914f07413d03a63a"
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
