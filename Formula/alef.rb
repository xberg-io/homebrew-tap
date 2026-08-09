# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.59.0.tar.gz"
  sha256 "15730140669f71040751430f309c9067515f7aff67fad11b252fe9dc7de145e7"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.58.3"
    sha256 cellar: :any, arm64_linux: "8620d6b61b8aeb71e7388246ff1a5c5df97a3d5a0ba892009cc39fe571444b36"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9e24ccf0bdc4cfc809f0365dc200eb77ebf85688bf084fceef800a107cb1c299"
    sha256 cellar: :any_skip_relocation, sequoia: "d72cf28d776a37adc68eafca56af84188d93ce1c801292b4faffc39791f810a5"
    sha256 cellar: :any, x86_64_linux: "4967d73859c4447233c480c4a47d24ff8c43912f841411e54fda8b3f5b972622"
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
