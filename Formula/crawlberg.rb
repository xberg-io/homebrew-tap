# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.11.1.tar.gz'
  sha256 'b7cd9044faf79a45bb6c971318217440eeba66ddd5c92f6987f884325be78480'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.11.1"
    sha256 cellar: :any, arm64_linux: "e6addbd7e30cc7619847d6b1962dd8d8a5f15ae3a0a4e5e8eba3543444cccb8b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c1bd770a0b5b6a80e9bf6a14fae1673b003ec0d0ff534f955123b4bdfb9c392e"
    sha256 cellar: :any, x86_64_linux: "8ef092488323fed09e27c69ffc599d58a1173c5686f5574a05030691c5e07f59"
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
