# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.14.tar.gz"
  sha256 "36ee1f8e5019fc4adf341911b1a52fa4911ac719fbeb477b6a62367878d1f0fa"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.13"
    sha256 cellar: :any, arm64_linux: "fb62d7de21c34d9a971380255dd604dd2a43f77985f53ec76c3cd11b966b461b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "21bf6ce89f86bf39b233232caa3e862e5e162ce652088c00e5ed648747d1e910"
    sha256 cellar: :any, x86_64_linux: "3c84d1231d3d237bc128eae50bf7cc5159b9a53dc8ad56a204f1d42b759ca1c7"
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
