# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.91.0.tar.gz"
  sha256 "4b126b56dd6b61d40dabfe5ee982a836caf79caf3d7e05d95a7f7b2f54b9aff0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.90.0"
    sha256 cellar: :any, arm64_linux: "14f6690a83da5296995126b768855c42336eaa4068fc9cc0f1473f90b0086394"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "05d3868133fc97ecbb7f527f90b405ad811fe736857403df5f18ac3a94a98336"
    sha256 cellar: :any, x86_64_linux: "569160ad1ae3c344297299cb29554fc83511358552881d8fa3f316c4101e112b"
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
