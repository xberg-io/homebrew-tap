# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.1.1.tar.gz'
  sha256 '283230d61bab8492d8640790b9ab5dfe008ad8e15435cae068af8a5751ff1a14'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.1.1"
    sha256 cellar: :any, arm64_linux: "45af9b5ab98d68fa0a79f20b04342f8bd4c6d629b98d93280d26f622f138eec5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "16de897236d523a4019488723d25bad950c2f513bae834a0925250ffcb4cc62d"
    sha256 cellar: :any_skip_relocation, sequoia: "f37e21010f45506887b0e4787107ada36a98cad089a3fb259e1e76baeb2c5778"
    sha256 cellar: :any, x86_64_linux: "47c46f4c07c49fbd1f7d323e185f9c9b651397300c337faf7f91abaab79de430"
  end

  head "https://github.com/xberg-io/crawlberg.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
    system("cargo", "install", "--features", "api,mcp,mcp-http", *std_cargo_args(path: "crates/crawlberg-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/crawlberg --version")
  end
end
