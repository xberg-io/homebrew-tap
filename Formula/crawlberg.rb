# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.6.tar.gz'
  sha256 'c81cf30ada858b51975adfffef4c7aa8a01b4dda30c1ffbcd506a1e3ecd35790'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.6"
    sha256 cellar: :any, arm64_linux: "5da4eaff7e3aea9aef0b6baa09709a8a811eb23118116eec55c073a5587fc598"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "73178ef93e49dff8331a581ccee7c66d0e63f1a56f7b89636ddd8401ef7f1893"
    sha256 cellar: :any_skip_relocation, sequoia: "f34af4537c215c99fab4ea446f9364bff4f7275b30b4d6e6f06e707489d6b39c"
    sha256 cellar: :any, x86_64_linux: "a6e92ee289365465e6b21829f1a5d6342813129e79ed662cec9922678d6e5c45"
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
