# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.96.4.tar.gz"
  sha256 "cf744f0807ab9d2c1e5e0220dad4a5b4a88127000c82cb18cca8ddd7f7f27fa5"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.96.4"
    sha256 cellar: :any, arm64_linux: "6bb18ce30fb980bb1d83b7737c3ccb14cfec85b0a799c3b82a21cf83e2bf3569"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1cc5ea88e015f16970845d40540d860366c93008857d7634c5b2c49cf6712af0"
    sha256 cellar: :any, x86_64_linux: "4d4d472e6f4e77fa4694e11e888c15d400c6f48d2dfc6549ca720f6001a0b612"
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
