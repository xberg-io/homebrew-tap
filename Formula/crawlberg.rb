# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.13.1.tar.gz'
  sha256 '07c98e7df60e87d978fe556a64247f5ff8c811cbc509518a1a4b9023fa60849c'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.13.1"
    sha256 cellar: :any, arm64_linux: "7d8b208f84d0dc914340d829b9a26151c79b445dbe37a64bd87d80507313bd13"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b7150511db89e0b29526324999c37c1e918f9cfaf8e123c4d3c29229849f5ad8"
    sha256 cellar: :any, x86_64_linux: "5ae7b1edd032351ea6918c66e5b63ce7cbbad925ea2b3861bc2075b6652f3e76"
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
