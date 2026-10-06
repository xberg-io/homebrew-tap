# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.106.1.tar.gz"
  sha256 "618de61206f75ea46d32fada8ee4f98af334ff1b3475097a569b780a19653b72"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.106.0"
    sha256 cellar: :any, arm64_linux: "bb0bcda6f97c8ae0d334d028cf60d3d573fea6273c5d3438fb3b4cb82c873332"
    sha256 cellar: :any, x86_64_linux: "79e5aa3c0d37d4e11767afca5a109eb4e8e2719efe0d3ece6ab663f274f00bf6"
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
