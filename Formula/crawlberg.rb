# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.7.0.tar.gz'
  sha256 '1ae3460facc1e0f41a20cde57bf34d9189029537f92367a5c97c9be2894431f7'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.7.0"
    sha256 cellar: :any, arm64_linux: "60a6764ce50e80ac027b624284984affebdd8548101efce8c8b070309b9ecc6b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "22a636095bb2a32b24d0840e9d029a8e8609d8f80fc5087ca74e208b9fddeaed"
    sha256 cellar: :any, x86_64_linux: "9a26d912545a978b9db99ef5649017ad899f8a2eba8c76c78229bf6d203c3459"
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
