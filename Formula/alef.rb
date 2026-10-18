# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.111.0.tar.gz"
  sha256 "bbec4eb1bfaec23a7847f48b32bbd1116f2f454788af8ad873d95f450362eff7"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.111.0"
    sha256 cellar: :any, arm64_linux: "d0dac12bd36bbb8ce42ac8f6deba75f9c546aa93336350c025682e79e698c0ba"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b7b51860c8b28e047db8e3eea3e96245030c139c601eaacd167f7d67fdcf5c80"
    sha256 cellar: :any, x86_64_linux: "f213bf51425923c62359f44e0b9007b3d2921d34027415254f3ea6ca3fa411c8"
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
