# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.10.3.tar.gz'
  sha256 '1b20cb1e62d08ebfbca516523216daf7f816713c9ff8a4d6b3733d8a3facb6ef'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.10.3"
    sha256 cellar: :any, arm64_linux: "510dd9f23974c59b2af263c68c1fd0f0e5cbc1490e3e9937bc2c7f2f1da9d4ce"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ad351f8a7842332ec17d6461b781888e985269f74a07ed4230ec91c2db24adb2"
    sha256 cellar: :any, x86_64_linux: "e5a0286023dfdcc3dcaead864310ac626cbbfe67eb75cbea8534cd6ac9d52e61"
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
