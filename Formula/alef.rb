# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.93.1.tar.gz"
  sha256 "a7f5fd0cb05496b55267bf9a06ba129bfe274cc2f14ced76524362f27d289703"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.92.1"
    sha256 cellar: :any, arm64_linux: "36d65817bc4fc3aeb8e675756436217afe4b0dcf2e852990c4f783e8ee458fa1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "133a1d233a6b12cfb87d1182a632f51608148c06a72f69092cab52447432f5e0"
    sha256 cellar: :any, x86_64_linux: "cc0c46bf86f4b2a39815b958ac4f29561ce8546e2c4373b5217a22bc4966f25b"
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
