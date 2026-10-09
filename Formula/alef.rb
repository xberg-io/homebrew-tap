# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.107.7.tar.gz"
  sha256 "4f8e503b8cb229a83b934c89fd2a20a55298fd4362db92ae9f459988848ad9d4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.6"
    sha256 cellar: :any, arm64_linux: "e5c4019e495106f292ff9ad25a00c578d679b2f7f1d44355a470d74bed9715e0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b7bd8b9e45830dc898009782daaf19eb292114e018f816071700901abb9bca30"
    sha256 cellar: :any, x86_64_linux: "cb6e041c6aa177a2f19971f911e473413df45a1f115ac2599dda1fd28d269f81"
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
