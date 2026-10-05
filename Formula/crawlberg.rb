# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.10.0.tar.gz'
  sha256 '9d5d529b42eb0723b8e0f42dd462728ce0a171e350157b111a5d9fba30db1134'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.10.0"
    sha256 cellar: :any, arm64_linux: "e176e16fdbc7cd516635923c7cd344ec519d951ba3f4a1d31ef32ac6ed8b7d54"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9116db880d3791b1f51de6fd076cf66d2bd108f8e03731a1d963f42ae36a60ca"
    sha256 cellar: :any, x86_64_linux: "d661c5174070d1845f248ebd7e29348bac5fc9d767fe6df7bd9172426bbd4d3c"
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
