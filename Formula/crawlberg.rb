# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.12.4.tar.gz'
  sha256 '4b6f672aee33eb84f41297e6b338f3fe47bb3f05e109a4087d1308bfb1514283'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.12.4"
    sha256 cellar: :any, arm64_linux: "2d29ffca1dc92083dc4269808b6fa786d8d7a6e519b99bfb68a1e000bdccf1ba"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b8b2a47bf686379ba5b720ea7b099015dcbc0c001ae2b0169805a4302a12bd18"
    sha256 cellar: :any, x86_64_linux: "734ba4083782efeb141a8638030aecae8b63e96ee68000c50da1c2212c4c70d3"
  end

  head "https://github.com/xberg-io/crawlberg.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    # ~keep Bottles are tagged for macOS 15, the org floor; Homebrew would otherwise target the build host.
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "15.0" if OS.mac?
    ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
    system("cargo", "install", "--features", "api,mcp,mcp-http", *std_cargo_args(path: "crates/crawlberg-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/crawlberg --version")
  end
end
