# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.63.0.tar.gz"
  sha256 "e4614318ee73bb09964855779fdf51a23836685556bc1b289596b2a8201e50cd"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.12"
    sha256 cellar: :any, arm64_linux: "fe1566b02f7fb5518d800e952ee060ea1d28379be30dae4386c2216771c64226"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "37b067f192ecee6e5c572ae39b20f1098a5f94ad36e7a2a21ae28086c5d86636"
    sha256 cellar: :any_skip_relocation, sequoia: "ce604c8ea3feb3eabe039c8cb3ec046345b703e5ff05a2de4c1b932c0fd208dc"
    sha256 cellar: :any, x86_64_linux: "15a8d3eff2d9d61e85ad6699ba17410cc9fc615f166024103b5a6ceedb033525"
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
