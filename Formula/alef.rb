# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.132.8.tar.gz"
  sha256 "9778c308104a247fbaf2b2622d91f9c790ac2482b97b8de4c7a4eabbb79d26fc"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.132.7"
    sha256 cellar: :any, arm64_linux: "167598bebf9074d048b843e07eec55eb7eee1162e311c4e0a255c011c362dba4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8ad941ba4c561a524320e97c7101283499ba89b42b58e7a94611dfe68cbf1982"
    sha256 cellar: :any, x86_64_linux: "b70b6aa43fa1802814419f705099dff29a5bea5a86033ac352c44be79620764d"
  end

  head "https://github.com/xberg-io/alef.git", branch: "main"

  depends_on "rust" => :build

  def install
    # ~keep Bottles are tagged for macOS 15, the org floor; Homebrew would otherwise target the build host.
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "15.0" if OS.mac?
    system("cargo", "install", *std_cargo_args)
  end

  test do
    system "#{bin}/alef", "--help"
  end
end
