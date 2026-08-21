# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.9.tar.gz"
  sha256 "79412bdbf6fdf8f10d4b94fc4f1ef80eb743c322fe87c7d551aa51cea8908bd8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.9"
    sha256 cellar: :any, arm64_linux: "f385cb08192aa1bb386f7c87331b9f3a5703d8881b0616158368529cc419810d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "221377e8fd43ba239a6541a5964c5a354c3cdf887ad1956ce67407f20751d556"
    sha256 cellar: :any_skip_relocation, sequoia: "beb9af1ef410d8c10434cf4300904c4f6e3847940f899cfb1fffb6dc32578e9b"
    sha256 cellar: :any, x86_64_linux: "f004f363b06d9b8d93b68cc802c404ecc39f97dc5d4df57820050778d038f992"
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
