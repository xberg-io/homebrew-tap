# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.67.5.tar.gz"
  sha256 "91605831edbb502b106171474ae27de540e2c34d9472e335594422ef5a6d4421"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.67.5"
    sha256 cellar: :any, arm64_linux: "44d2a81395f86c9521f10381ae9b636c5cdd80ef8412311ca798535da9fc1a70"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "034e478f2ab839954f46b81f7d548605a542342c0172343db4ccf7cea57553d1"
    sha256 cellar: :any_skip_relocation, sequoia: "9087f5b5a27c5872da760628345bc7186c0b02122c59ca7424e709cb7ed06e52"
    sha256 cellar: :any, x86_64_linux: "994c76e11fe9c873b93ced2d1f09e8d538960c7fa65335f094bcc7b083e6da42"
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
