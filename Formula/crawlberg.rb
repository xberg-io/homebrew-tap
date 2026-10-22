# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.12.0.tar.gz'
  sha256 'e8aedd406d737897fcd4ca16635e75d2c9443b8ef08e07fda350931812c5dba4'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.12.0"
    sha256 cellar: :any, arm64_linux: "4dd9e42478471cc24a85cc00b0e169e04a723ecc998fe660d960063cee0c83cd"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "14fac6ee4fb933d9e62ae5b6953ba1e19efcef22dd7184d58d94aa3238c0e4fa"
    sha256 cellar: :any, x86_64_linux: "a088837d8f7c620d20f616c6dab6d316385777457790e0fca65dadeac1c890e9"
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
