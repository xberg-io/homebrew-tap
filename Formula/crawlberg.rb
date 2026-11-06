# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.13.0.tar.gz'
  sha256 '4b56c0d2d0f5c30db129269ecb7c21d6c84661a31ea89c02a84106aae57b4339'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.13.0"
    sha256 cellar: :any, arm64_linux: "6f8550bae5dff0d3ebab5cf4ba5e35d2ab591900bcca2c96fd19273ab8131fe4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ade3861deda4696e10eabc0843073ad43fa0648ef42ca81e4055566bd8c499ff"
    sha256 cellar: :any, x86_64_linux: "c3d6796adc0f0f78a1a2df00c78ada02c76ca7e6c976d9a9f1a3fbc2dd689da2"
  end

  head "https://github.com/xberg-io/crawlberg.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    # ~keep Bottles are tagged for macOS 15, the org floor; Homebrew would otherwise target the build host.
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "15.0" if OS.mac?
    ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
    system("cargo", "install", "--features", "api,mcp,mcp-http", *std_cargo_args(path: "crates/crawlberg-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/crawlberg --version")
  end
end
