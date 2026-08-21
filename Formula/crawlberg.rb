# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.3.2.tar.gz'
  sha256 '51b2bf7c9909934492587e0cd08d0eacb1f483d96386cf9f241f39522f337fd9'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.3.2"
    sha256 cellar: :any, arm64_linux: "7d9e3c54390fc7abccda971396633b0ad029e66d0219d707fc4b280214ef1050"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2272d949c3a53fd8a9d8354bc0ab204d110a61a2c5f75d97767c97dae0704d04"
    sha256 cellar: :any_skip_relocation, sequoia: "57fde331c5581c0181aa3369207fd4fc2dc95b7ee17cf56d9f0579276aa706f9"
    sha256 cellar: :any, x86_64_linux: "7debcf663138a9e002b2a64bfd92824860b709dd3bc54b3c4f1d7e04eb0d506a"
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
