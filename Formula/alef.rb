# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.96.3.tar.gz"
  sha256 "e7ea5c60118c72673125a36910ca717b1812875b3a68098602bc570117ea476a"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.96.3"
    sha256 cellar: :any, arm64_linux: "7b513e15a2f6dc17d3ac1f6048857ba47ab6f6469aa684b3a8d94537dd756676"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0045cfb0587e98a995ee72669c4d448cff1bbe83411c7b5418809c8b99a9fe0e"
    sha256 cellar: :any, x86_64_linux: "47998bfe85a02c04f5a3cd4ad9b609604c68955f1fd6953478382d98a72411fe"
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
