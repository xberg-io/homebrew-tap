# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.67.3.tar.gz"
  sha256 "1f697e2e39c7765b6a0b353150694b0c8a9917c529824736f100121473a4950e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.67.3"
    sha256 cellar: :any, arm64_linux: "4231eda4993233ae05b2dde14b08d7797bd924852ed44fe30d1c0a227e11e1dc"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "663cd8791509239b4f425b6919c57c3f187f5f570ba480522e42261e797a5c4d"
    sha256 cellar: :any_skip_relocation, sequoia: "d44f60fa9ccae98fd113a009ae6c03738f785070f1155e3b65a84b5ed481621f"
    sha256 cellar: :any, x86_64_linux: "d49a31add768593f09b5c2908a395782393cdb0e34bf0cf0d38dcb18e8bbc96f"
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
