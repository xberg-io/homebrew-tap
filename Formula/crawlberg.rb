# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.8.tar.gz'
  sha256 'eef06aa509c3daf01b00803a53ef0ddb4fc1a8711b1778006eee7d5084144875'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.8"
    sha256 cellar: :any, arm64_linux: "6580096b2ef441a255111ebe586e303f9b259618c41e52eaa786e7ebf8b3e7d9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1c6d64c055933f497188ac3722404caa0b34eee2309fb9a9bdd86b8e7958e701"
    sha256 cellar: :any_skip_relocation, sequoia: "a8738f96c8160c4a7c931c9682af1feee67c8a63c13130e92a91521ad0118afe"
    sha256 cellar: :any, x86_64_linux: "da3a30fe0dd2062b1a9c53c366331f8b7dd65aeaa0dd8a609fb2f29d324c052a"
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
