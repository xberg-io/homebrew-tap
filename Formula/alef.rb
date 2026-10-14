# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.11.tar.gz"
  sha256 "719a3ad183a1119307bb98ec3875662c7a50061603ff5f489eeafd37c61f11da"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.10"
    sha256 cellar: :any, arm64_linux: "1f3e4cc269e33a0be4844887c42181c9e7b5f1bc910d3732ad4e9d5a273769b8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "13dbe068fabfecef677f23f62fb82ef1a0462a935eafc26d2b3fbf0da2652926"
    sha256 cellar: :any, x86_64_linux: "6fd9bcd0b8d7c32310ac460ccd1808b435c43ecf14127edb406d30538312fcc1"
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
