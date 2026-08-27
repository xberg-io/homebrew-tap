# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.72.0.tar.gz"
  sha256 "225b806e88ff3161293a8ab5859642cc85761eb573b90dd1462b1f36866bb192"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.71.0"
    sha256 cellar: :any, arm64_linux: "5468a130f634c0827606368bd6c41326a6fe2a617491a29ae6453fe5054363b5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c9025f2b060f45fdec33478e8aae4610903aa35efe0730c9562f47d2ecdbe58d"
    sha256 cellar: :any_skip_relocation, sequoia: "8c0dd134448e8cb634e7b94f3896ceda3581fd918464a520fbf1fe85c2167ba5"
    sha256 cellar: :any, x86_64_linux: "a5e0e5df2e11db820649ed37c85cc6b068000fa4fd5558019893ce0b40fa9ab9"
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
