# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.55.4.tar.gz"
  sha256 "265e0678bae1b9b72a48ec76763e16bdd36cef9d308a9db4f78d64c7e5b5cf9d"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.55.1"
    sha256 cellar: :any, arm64_linux: "54309c4b69a204053e8c6e9f5d09648c8ac43db86f50fbdb1cc17a9d75aa21f6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "cee05265ecc0cb84d46d70baac3c72466896823d6689c0ff549ba1b3b46a26ab"
    sha256 cellar: :any_skip_relocation, sequoia: "cef780fa5279c7c971887b80dd247c522a91da3f6c1918b7949fd9225a341a3c"
    sha256 cellar: :any, x86_64_linux: "d84ad392e6acbc6d1835ebcf5859b73c72fe31338f1ef44617fb3ad399ac7afc"
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
