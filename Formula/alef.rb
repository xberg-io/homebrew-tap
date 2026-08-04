# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.51.2.tar.gz"
  sha256 "a1de85388080f2ba5d57b432fc9547482331ab1048b4160f8546e1e36957a90c"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.51.1"
    sha256 cellar: :any, arm64_linux: "f29e3256e9a7bbddf4bb5eee0dfddde903372fbb4de4cb85c798d85ef4e3a1f8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "674f25d583e4303c59f13655d76e248f7fe3832105860b6ad0d14bb50b14ff96"
    sha256 cellar: :any_skip_relocation, sequoia: "a32882ae5d26b7ee27879a3cc679140b952189fe02a457d4fc41d20e5a2e5ab0"
    sha256 cellar: :any, x86_64_linux: "d7927dfc5b9112576c707c7c7f2b349a865035209bd68354b4bfac752258737d"
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
