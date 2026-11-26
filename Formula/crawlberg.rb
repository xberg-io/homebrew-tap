# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.13.5.tar.gz'
  sha256 'ac5dfbf61bcba44ade232d28f8661c556a38b6c11d903e2297168f493caeb327'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.13.5"
    sha256 cellar: :any, arm64_linux: "10bbf55ff62860ab937d76d587a20eed7f07ff256d8dd920a9940fd4a9e0be19"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "12aeba0769a40f4083d39a06c7bf64ab921e0b50b6576f01ddc18b4a5f5ae9d0"
    sha256 cellar: :any, x86_64_linux: "fedd15b773d1b400771aa89c93873404ed6437b93b9f486cf88a5e2caa411283"
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
