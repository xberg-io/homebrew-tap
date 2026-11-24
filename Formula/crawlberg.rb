# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.13.4.tar.gz'
  sha256 'facb42de19af0667ef037b2cec4ff30ced42e03ebc9698c6842be1de155bc236'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.13.4"
    sha256 cellar: :any, arm64_linux: "64b8987d8961cd2f85a6997fa6de404ffcd14eaab9be9a7930e7a02230d48618"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "312e1ac1279ca678b3957097264105b5d0e442f6c00d09ae4663c90c3d4f4f6e"
    sha256 cellar: :any, x86_64_linux: "a0a26749bc41ab3ab9b122f28974fd39cbc0b87ccd95f4a329ad3c6227007554"
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
