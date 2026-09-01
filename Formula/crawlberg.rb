# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.5.0.tar.gz'
  sha256 '769862e4dc99c8eebb2655dfc609a91cdf5e1f26a9c33a0ee25fe8c16b720606'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.5.0"
    sha256 cellar: :any, arm64_linux: "84b0be058f4bf87f6defe3362cfe8fb316df8324af8574513b630d3a9b565b5e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4e8536aad417501741fdc750baa6652551342c33cfc5d4fc195392374b5d208f"
    sha256 cellar: :any, x86_64_linux: "0e0daac248f1f9cbe34ccf11edb5d11231f414f797a7c8589b8025c213a8f0ef"
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
