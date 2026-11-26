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
    sha256 cellar: :any, arm64_linux: "5d2de1f9d60ba6eb15979a2c4ee5ed112b8f53141d0dd001b4eb2f0cd89873bf"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8d8f4484383773343225aa3070994e264e028245c8e19948e2b8e3d5fb8eec93"
    sha256 cellar: :any, x86_64_linux: "3207261f60433ddbf2eaee08d9128bc47d6bbcd1592fd2549832fa323c85b1db"
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
