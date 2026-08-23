# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.67.2.tar.gz"
  sha256 "6480c69b5f970f45bbab35655b914b33d507076f4f15c445c2d0e36b44cfa113"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.67.1"
    sha256 cellar: :any, arm64_linux: "e32b039f7d0ab4f7cdd8459ef451a866da8dfc2d34cc2e752872a0cca0ce9e64"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f16c71f996db162d8976aae60d1a95a00443545f997ec859a81dc709ee697b95"
    sha256 cellar: :any_skip_relocation, sequoia: "5069631fe25dcb64d1d54cf13347b7086acc5d30113b792353fa50fdcad83516"
    sha256 cellar: :any, x86_64_linux: "ee2dfd96735c5ad2fb1030e27f20b55498456cd8126598777b1c176989058c0c"
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
