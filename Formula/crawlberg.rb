# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.6.tar.gz'
  sha256 'c81cf30ada858b51975adfffef4c7aa8a01b4dda30c1ffbcd506a1e3ecd35790'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.5"
    sha256 cellar: :any, arm64_linux: "441018e6287bcd0f81063ce34aa1e71ede75486d6a076ff5c0079ce15bd17d0c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6dde1a301518995ecbf2b338110de939ad5818607e59748a8d5acbb7c989df29"
    sha256 cellar: :any_skip_relocation, sequoia: "63283752b4e791c4289f12e896580679ee6a6109740a0f5cb8d0b131d05a7e86"
    sha256 cellar: :any, x86_64_linux: "ad7054e9212d4840538d7f0d16d6caf14f03e96ccaaaffd4678acda6651c828b"
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
