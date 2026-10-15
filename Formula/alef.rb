# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.16.tar.gz"
  sha256 "ea5c7236a8c133a42cc13a92aa031706deb452093d31069a14493bc3aa997c9b"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.15"
    sha256 cellar: :any, arm64_linux: "22179b9671ee50dc55a49fe1462f5bae4451600ce310c910d8ddd1de4763b00c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d828e9d57a73e99cb9de1974ec14d71bd45c1a9c7b9634ab5dce5c53c6f9848c"
    sha256 cellar: :any, x86_64_linux: "31b8647682fd115e30a038043240c1620f569b9484442d7c32881d011e85948a"
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
