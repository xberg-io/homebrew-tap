# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.12.2.tar.gz'
  sha256 'ffbbbcbb23baa0c2114f51da3ce59fc802179f64a7f9e6ba4517954525163bb6'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.12.2"
    sha256 cellar: :any, arm64_linux: "a513bcf4b1b2bb0dca7b0e33ad06ce5c09c52c02706a216bdc1287d80ee9d185"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a6060e12e3e591d03980e981ea8a34b3b648af968ed955aa6309cfe30a4afec5"
    sha256 cellar: :any, x86_64_linux: "1e3c6a46c7244c99bf4c477190c0149fe42dfd05d2f2cac53bae30fef8125ab5"
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
