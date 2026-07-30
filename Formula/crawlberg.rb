# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.12.tar.gz'
  sha256 '6134dba91bf65a5f6bbaf02e5c7dffc089a22f6777a008558efceb89eef0e50f'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.12"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a230589b4e14447d219a4956252b64aec9cf8e4a4470eb4e8643af4be5f6cad4"
    sha256 cellar: :any_skip_relocation, sequoia: "fdf19d6a208c85088d4ad4e9f7dfde5ea2107301b03d7f18dbb727e75fa48217"
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
