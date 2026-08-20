# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.6.tar.gz"
  sha256 "4b5f02b4626acdcf6d362b1be2218975af5d92c5faf2fcab830642e9f7dccc3c"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.5"
    sha256 cellar: :any, arm64_linux: "7bbf77b40f74129bdad68407126f45bce4fb311a2a7628e2e6ab35d8b2c9b4d8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "64f4784ab3b84c51116f694a5f561dc23c77673a60db14901a7f8c4cc239bf19"
    sha256 cellar: :any_skip_relocation, sequoia: "54ce9d5c3d17e606ec91097e1007289e61e5de8dca806ea4adc231537140620d"
    sha256 cellar: :any, x86_64_linux: "a09f58ec1c553b8772064331d7bf4ecce331568e3fab4fe83fccec86bc854ccf"
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
