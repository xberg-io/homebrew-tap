# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.51.1.tar.gz"
  sha256 "f20c093ab59fd85de03137a1894a464348a5d295b98a0f9f21b0eba1ea846cb7"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.51.0"
    sha256 cellar: :any, arm64_linux: "6fb130140ccfea2deecac463e366c68b9d22b7a6630e34f600bcd9fcbbeebc63"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "38bfe9f3415bad27535a22129150ce47be733b9628e8243d05b3983e3b46451c"
    sha256 cellar: :any_skip_relocation, sequoia: "366a7facb17addcfe2633026c309a4bfd5f7fadf17cfe502545ade331e3891da"
    sha256 cellar: :any, x86_64_linux: "d2291a2d25c6232bc822ff783ea45885731256b3aa0292646f700a0042786cdb"
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
