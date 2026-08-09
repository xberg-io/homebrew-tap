# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.59.0.tar.gz"
  sha256 "15730140669f71040751430f309c9067515f7aff67fad11b252fe9dc7de145e7"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.59.0"
    sha256 cellar: :any, arm64_linux: "3e824967401707554017d492267c8ba7ca202ffe92f0b9d30cff96b5271ee662"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9ec9cf5d871b25232260eec9151bbed176c1a4db6e81b20e9f6668616bc329ef"
    sha256 cellar: :any_skip_relocation, sequoia: "1266d5f4e4da7f68ff50d853e0394ecaa7d95bf60101602df509e80a30038aee"
    sha256 cellar: :any, x86_64_linux: "3e91cc4092838f2311a0075b4bc11af89b40e5f7cf6091dc039dfcdc3ad0f1f0"
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
