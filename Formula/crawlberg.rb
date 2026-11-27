# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.13.6.tar.gz'
  sha256 '8885ecd1099af893e606915e76301283a1159abb609025c3065ae81481df6600'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.13.6"
    sha256 cellar: :any, arm64_linux: "5bd2eabc2c61b20edbf98c263c0a394984b6dcf5fe546a83268341de9662a3c6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9eff40439210cd45bb30d6aa5649a7eda85a7935a9bdb560af71370317229a3f"
    sha256 cellar: :any, x86_64_linux: "457f85bdacf9e8d34421d5a03ddb124d40a0c0dc604457856449018d0278cc6b"
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
