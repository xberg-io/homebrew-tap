# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.10.tar.gz'
  sha256 '7a6d13ff9dd19d2cca57e215ab1ad90e9145326ed9ea9f964009300e4d92574d'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.10"
    sha256 cellar: :any, arm64_linux: "294c0d982adb3ee5fa63fd693098c8ddab6726a76080ecd99a42f3458de424d9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a16ae503b31e6700bfd7136e31ac7ce1ea4fe564455675c09d4fb2d9c950fed1"
    sha256 cellar: :any_skip_relocation, sequoia: "8ff6cd92f01328ed3b43c139db097e500a456f33ace05b75f23d2a3bf3fd341c"
    sha256 cellar: :any, x86_64_linux: "474e2961ffe8b6a3cda11c8f17386804c18a5010ba4df9483bc6c6a2b1d7f1fb"
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
