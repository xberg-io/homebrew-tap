# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.6.2.tar.gz'
  sha256 '1547bfcb2ff9e1338f528cdd5f874f4e84bbcfb59f4bc1fc7e8c64da8755969f'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.6.2"
    sha256 cellar: :any, arm64_linux: "def8f067f30f6f1c155ea26754cc4e0fd3857db397d4027b8c0ff0d7d59e4f74"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ca6f7685d07692f3079b2ea1c606a3c4696dfd33302418030c1495691b743e60"
    sha256 cellar: :any, x86_64_linux: "98a2ded3ed19abbcfec716b64cf7cb383f1478b96cb558bd5cd360b024e1274a"
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
