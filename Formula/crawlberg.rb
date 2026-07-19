# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.7.tar.gz'
  sha256 '84683e46c57d2c346cd9d13da8b370fc8c29890ed6acd4763bf10dad525f715c'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.7"
    sha256 cellar: :any, arm64_linux: "b2541c5196ae93176e1a6a5cef36831cb55d5eb1abac75eff918251221ac1a57"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "66f477d4f750fb4fabb3f969d26d95a9c1636a55422e1c60fe6aa603214b0303"
    sha256 cellar: :any_skip_relocation, sequoia: "7878e1ebd3dcfead7a3abdd743d75062b60f27e2e37f8c23e7278165a5e6ca0a"
    sha256 cellar: :any, x86_64_linux: "ac7ba23a0765a36cb8f21a9378614e0132f781245da0823889415ed66c6947b8"
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
