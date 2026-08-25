# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.68.0.tar.gz"
  sha256 "08a9208c3922583e5c39164c72533e17cb399c68ee7790c624ab38b8c55ddc21"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.68.0"
    sha256 cellar: :any, arm64_linux: "652fa283c3d7593f65d62e48531827a2c6ec1d72f91a7a744d395b4a0af8b207"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6aa098af1902ede61720119ac82acc5d83da7e7046dabaa5e5cf8bef9035cb36"
    sha256 cellar: :any_skip_relocation, sequoia: "c9cdf5cbb2cb87ce4162769cd028b9bbe0da976794fdd7e8ec01813178212718"
    sha256 cellar: :any, x86_64_linux: "9373e1dfb48e76c6ee42a6af9defa1240967f39b2671e9570411775520d2d278"
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
