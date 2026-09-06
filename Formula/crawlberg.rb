# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.5.2.tar.gz'
  sha256 '7fdfacffaff088c51d67ad4154e5583500da3a7846b7d5c7067b291d0057ca29'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.5.2"
    sha256 cellar: :any, arm64_linux: "1113ce5c0d53edca8294cb54cf3dca5f564f7a95b82409ac730b50764a9755b5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "13fece2e67d4b869eaa59ca24c381131a7366fd4a50a08fa075efc298b0d321c"
    sha256 cellar: :any, x86_64_linux: "ad5249c0bf6aa20c0b70c297988266324de48a2ec4d3ca1f4d82fbcab6702f5c"
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
