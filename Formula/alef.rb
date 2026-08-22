# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.11.tar.gz"
  sha256 "ae802fcc68a2afcf314ac767254929ba89f7b2faff7e170f5cb76ea0ed789229"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.10"
    sha256 cellar: :any, arm64_linux: "527e9932ca37fc8a551c1a2055a0840168890e7e64da166f3f4194e4763d8339"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6c6ac0fafd29da336714a484395a4f2450bbbb9dde80a34944836c3e8fafecb5"
    sha256 cellar: :any_skip_relocation, sequoia: "d561725ab091f1f99a6203a07fdd8b2da458564081a3cbdeeec98c07eb17df35"
    sha256 cellar: :any, x86_64_linux: "c46fdd33c34e45378543d1ba6bd075edc54735d67d15a2b22ffa8a1faef15478"
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
