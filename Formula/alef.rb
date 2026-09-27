# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.97.1.tar.gz"
  sha256 "f79d23668350c1bef43fcc6c7f2f31846ab45a009dba6827382bf515d610222f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.97.1"
    sha256 cellar: :any, arm64_linux: "7ea38d864dfa97f7d45c9f35eed8fdac92a4af8b8dfdf615add34bf119d379b4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2ffc581db2c8aeba2765bf9bbd9b3da9234e9e663495104f655f63c2b81d89cc"
    sha256 cellar: :any, x86_64_linux: "ebcae4fa7dcae1997374b1bbcf65bf437d8841cfe6b672bade32ede59a979a8e"
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
