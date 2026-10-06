# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.10.2.tar.gz'
  sha256 '8930d92c8019ef45d230f04940b0c3dbfffd7c5ad9984a2e388edb9efcad6d91'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.10.2"
    sha256 cellar: :any, arm64_linux: "47f07f272164ccbb50ecc4f62d420cd2798365d8140431e3d2ac826122c89528"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f82fcbce101d74c04dd38fa7fcdb3290f20537c76bf952d0d94b2ee8ecd03b26"
    sha256 cellar: :any, x86_64_linux: "0d05af79785dc35452b689163d1371fa4ce6f473f4114d9ff0093b5f1a7ab8da"
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
