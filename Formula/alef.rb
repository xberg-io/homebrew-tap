# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.55.1.tar.gz"
  sha256 "f2deb482031521c49801807cba72a2511c427569956c408ebce9b01758ce9c6a"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.55.0"
    sha256 cellar: :any, arm64_linux: "5cb88be46139cec0e0ce8e70d0b1500658ff5ef8fd494241182e0427f10fe854"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "608d212dd99967d78407beffc0ce0ab4edb0272c677cdc994cb0c772920d0410"
    sha256 cellar: :any_skip_relocation, sequoia: "e56cc6be3bdd50bc5fae6e44147f147e867caa1333f4a5c8297d83906efc6da3"
    sha256 cellar: :any, x86_64_linux: "afc24ca953499e42172cf3f2f529d2a2b34ea6be4c4cf30222596407cc4fe101"
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
