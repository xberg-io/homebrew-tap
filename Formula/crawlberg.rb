# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.1.4.tar.gz'
  sha256 'e208da77cd183d3d3e93203040dc3cc1c5d79f6e77cdb3014cabe40f96d45453'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.1.4"
    sha256 cellar: :any, arm64_linux: "c2b3a807491d136e88fc62b6dc4ffd9474129cb8aff8bd05fe481f8cdd297414"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d34a8f6e390ca00e6aa57e13eddced430219c98ce81fb0124a6c3e696ea05136"
    sha256 cellar: :any_skip_relocation, sequoia: "75dfecbf0fcbf5f0e212b23688370476541a37f05340bf718b1d8973fbed7205"
    sha256 cellar: :any, x86_64_linux: "801e66586ec5220eee7212d080423b75ad162d07220aecacb46950133e88c639"
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
