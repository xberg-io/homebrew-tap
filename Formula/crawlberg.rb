# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.4.tar.gz'
  sha256 '829d9f6417f78edd139a3c8537013a283718815def57436f490952098f278589'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.4"
    sha256 cellar: :any, arm64_linux: "36a80b3d51bd69ff1f70afb84c9b198c1465ea618be4b8198c9e995549ed37de"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "bede31ace07c127e853b8c549818f6993accc78482a1c39caeb3ac2a36c2c5a1"
    sha256 cellar: :any_skip_relocation, sequoia: "d9ab2cfeb0b2453ddfa9d7dc321b80e929059fd85517bb0aa90ec2f8f2054639"
    sha256 cellar: :any, x86_64_linux: "b400869897ed89891b14986b8e837a2f8cfadd5d4b14d2ce9327fc81e6123a2a"
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
