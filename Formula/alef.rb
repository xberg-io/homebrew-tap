# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.100.0.tar.gz"
  sha256 "4d6f13d9819d834befe368700a9b47cbbcca246f78a6d53d52a447836c8fed9f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.99.0"
    sha256 cellar: :any, arm64_linux: "9cd15cb7c77647ece9451f25f185ff28eb5373e9289c6d59ebae22299ad2e6d9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5a7442427f6e270436be2ef31b0ad63bb6b51c6e3e2ccc2109567f4172d20667"
    sha256 cellar: :any, x86_64_linux: "84a1382a92fd6a2a8b886642f9fb51f80f10cd818dfc94e391b96217610bca73"
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
