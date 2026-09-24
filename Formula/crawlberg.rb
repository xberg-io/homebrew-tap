# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.7.2.tar.gz'
  sha256 '2a5176aba1848135136ed7f9d4ac6404cdcf48ef9db58473292d8cc9ad66be90'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.7.2"
    sha256 cellar: :any, arm64_linux: "30f58e37ce04c061c9490ebc464958c75444696370d4f116cbf44ddf253646f6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f1ce444ddbbcbcd8bbc6fdd736fc5193298ede44c86dddce6b5180b7e7b45902"
    sha256 cellar: :any, x86_64_linux: "d841fa9e2ec6da10a1f3c716ca18078756d0f366ddfaad801f5ced152e464dcd"
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
