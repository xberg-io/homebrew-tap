# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.20.tar.gz"
  sha256 "479afcabbd44acf2cbcf9e65b3acc123c455d768c0155e4af3dff05b19a8036f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.20"
    sha256 cellar: :any, arm64_linux: "98aae759d73d36553db783979c42795cb400deb585bdb4156faa4a944f6344af"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e8ef13ea840185ae14bf64f3cc9a0ce653d2782e4585638a9f89514463b05730"
    sha256 cellar: :any, x86_64_linux: "ca62505cf3fbe1232083967832225742e3e3570aee83eefb5470f3dd63fda684"
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
