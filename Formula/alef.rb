# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.107.6.tar.gz"
  sha256 "b3a4a398d5f3422e8f6d2afa9133c414c03a5abb971d2d9cb1263aae1cecbf28"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.4"
    sha256 cellar: :any, arm64_linux: "42eed59fef943d8cde46018bf0c66e6d8c3c001a74f1a5019b512946b20ebf96"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a401fe786f5b7f4323f8b47893fb3638dfee93b1629cdf08aaa0cd94a585df2f"
    sha256 cellar: :any, x86_64_linux: "e8905a88b9b7a9a7720ed5127770ead307cda7b90e42e8efd8987a5388baa65e"
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
