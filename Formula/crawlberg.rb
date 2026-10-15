# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.11.0.tar.gz'
  sha256 '0fdd7d9a988e40c59a1214ac6f84061714bcf36acc9c1636f9ee00fdf465c570'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.11.0"
    sha256 cellar: :any, arm64_linux: "9944a70b49ecc0939db7562173a92230dea881d32c8bf5a1c6a791a12635731c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "414f172cc7c7711676c54ce3c24c008fb11ac2eb0fbdc14cf3258033cdfe63ff"
    sha256 cellar: :any, x86_64_linux: "abd088ed77def9528b13b54e96d7c041a9fa27da0a7da1102caf1fc98b6c29a2"
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
