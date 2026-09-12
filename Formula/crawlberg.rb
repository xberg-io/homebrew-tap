# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.6.1.tar.gz'
  sha256 '4e29fdceb2fcf0c1fe66132694ea7bfa66d789d7b3536b96edf1d4dec61b4ead'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.6.1"
    sha256 cellar: :any, arm64_linux: "526d6cc47615a22979b7bd4820b69cacdb459be3e8de61dceaf47e9ce30f38e4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ff16991cf5edd992c6d7a4c1329d5067306689722f427c79e2a47d0d05034528"
    sha256 cellar: :any, x86_64_linux: "3dad9e885fb8d8a09d7864a2d6a2461e94937d154d0f515d6c9169f4cee591fe"
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
