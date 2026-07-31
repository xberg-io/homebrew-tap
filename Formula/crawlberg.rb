# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.1.0.tar.gz'
  sha256 '379430cb25dbf435ccb5d7f8164ca674f974664edc445f79a215cbaf2b791927'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.1.0"
    sha256 cellar: :any, arm64_linux: "772889fd35db229516bb8ca7895f2b16b181a08f31d8770fac134d2d1800c594"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "47f75141fe2cb696a13ede804ed20adf8fbbcecd5241fd45e3225eeabc5ce58d"
    sha256 cellar: :any_skip_relocation, sequoia: "656ae141212d8b1943ec76d1cb031aa21c5527bff28102b7d596624c1ab85f30"
    sha256 cellar: :any, x86_64_linux: "f6ed8be2869af597ba6ec3f1d5ed116e4456772550516aa19709617bf955667a"
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
