# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.14.tar.gz"
  sha256 "36ee1f8e5019fc4adf341911b1a52fa4911ac719fbeb477b6a62367878d1f0fa"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.14"
    sha256 cellar: :any, arm64_linux: "e97c694c45818d0839d531b21aad62bd6f9b5491b3bdf044053c0910a447367c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2e542fbb6df21bca024f063af6c23d01098f4477660e9ad4ebac844c8ea14e78"
    sha256 cellar: :any, x86_64_linux: "cf7feb4dfe8a666cc6e36079323fefba7a554eeebe02b8a92906c0c517f2eb31"
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
