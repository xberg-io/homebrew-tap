# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.7.1.tar.gz'
  sha256 '87b4830c35068b8c037b3473487ebae0dbbf168cb0ab43c2c474e121f0231f4f'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.7.1"
    sha256 cellar: :any, arm64_linux: "e05247fe4375882a215e6e9e6e0afb9082b2f4bfc7a0b75d53dbdcd69386f992"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9a3a08db0b49fa69455af922ba9d42b61a69ea7923aa1a70010ae0cd81e7b1a6"
    sha256 cellar: :any, x86_64_linux: "cf17cb65fa833f128bc47cfddafcc31e60259d4bdf0b70679fdf240750beed32"
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
