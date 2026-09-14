# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.6.4.tar.gz'
  sha256 '1eb12eb4c8f7d0968d7167d665cef4f0097e588cc60de30145a7028500741236'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.6.4"
    sha256 cellar: :any, arm64_linux: "e7bfb7c48cbb89a340261668c852591feae9faf0de87423b08ca3232ed6b8fdf"
    sha256 cellar: :any, x86_64_linux: "5aba999da8c55a0e9518677d1e2fc720f4291992ea0fa96e96081fce2203bf4a"
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
