# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.104.2.tar.gz"
  sha256 "2dd4de2b4f5d559e9709fe33f28c7381b98a4983c83f418c53928c4249541d11"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.104.2"
    sha256 cellar: :any, arm64_linux: "a9f7a98d4e3cfc6325857f54da4d938e11c46125402c40276f54a15251ebaeee"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "afc24785ee1f04b6724273a7f51ebfd3e54cbd80b1c83a063b0dc8935178e994"
    sha256 cellar: :any, x86_64_linux: "437222c24b13acd227bb39bcc93fbc9a3f56aac90a9a90f73ea5a331884f3323"
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
