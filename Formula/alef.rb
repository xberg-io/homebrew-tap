# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.91.0.tar.gz"
  sha256 "4b126b56dd6b61d40dabfe5ee982a836caf79caf3d7e05d95a7f7b2f54b9aff0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.91.0"
    sha256 cellar: :any, arm64_linux: "d29e1388491a4b1926d1edcd87f18f6d15888e34ceb1046e32b4f5210dd56c22"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f867d224ac6f3621c58321263367250ac78df14c2c0797cb8ac928b51057b480"
    sha256 cellar: :any, x86_64_linux: "b2808e441e1f1f6dc6f5aa80c8e96f3880c12d2ec33eac0cae6eeb34253b6535"
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
