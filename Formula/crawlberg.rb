# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url "https://github.com/xberg-io/crawlberg/archive/refs/tags/v1.3.3.tar.gz"
  sha256 "377cac6cd0523577af781fae3f0481e6706fe1b39842ca930dd97621344585a0"
  license "Elastic-2.0"

  head "https://github.com/xberg-io/crawlberg.git", branch: "main"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.3.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7e17a0e3a559ef65fdf1cb6d7adafee7bda56326b60f53ad9289135de61a75af"
    sha256 cellar: :any_skip_relocation, sequoia:      "b79630b795e4a2512a357fd882eaa5d3f21ec7a367ea5e3600fd856b2a15bbe6"
    sha256 cellar: :any,                 arm64_linux:  "b3cda29169ef53aa685ed9c3252187ed1ea8f1e229aeeafa7b1e881c95a3187c"
    sha256 cellar: :any,                 x86_64_linux: "333fa15b7e0562a73bed1bec85a007e0e2954a5d9d690715c16cc87bc8910854"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    ENV["OPENSSL_DIR"] = formula_opt_prefix("openssl")
    system("cargo", "install", "--features", "api,mcp,mcp-http", *std_cargo_args(path: "crates/crawlberg-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/crawlberg --version")
  end
end
