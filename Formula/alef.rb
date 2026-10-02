# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.7.tar.gz"
  sha256 "c76f639a2f2a0342076c0d82c8aa6a30cf08bd016a1c8af04e05a6d781301f58"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.7"
    sha256 cellar: :any, arm64_linux: "a6b58e320ffde1111b72e644f3649f74d29beddbdb8f65b1a4982d04d9e8a8f4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b14c7292256b095f3b5de12b5146e965bc292b0dec6e7dd428cd9d5e121741e1"
    sha256 cellar: :any, x86_64_linux: "ecb1d17f782ac24f807ce933a776ef6d002b40a052cc9227f3783d0c554de645"
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
