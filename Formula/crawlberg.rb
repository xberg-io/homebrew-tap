# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.13.3.tar.gz'
  sha256 '0fbfbd74d47c150f269109ead42fa9c78d088253e8c203982612cd1dc7f9456c'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.13.3"
    sha256 cellar: :any, arm64_linux: "3754e7c48f58db51b7aed9ba68f79a0476d57fb44d01f3ed81a3a8ad37064f6f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ea85474b23146954fabcd197569a8be7636d8479068553f4e9e29f1c296309bf"
    sha256 cellar: :any, x86_64_linux: "25e2b1fecb6a828a51c2d70709d9d294ce89561869f66555e04bd02a659976be"
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
