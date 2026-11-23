# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.13.2.tar.gz'
  sha256 'c294b0c70629941aacd7361116530ba47dd477aa882cbf752d7f11ea5e316316'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.13.2"
    sha256 cellar: :any, arm64_linux: "a9289a6760cd2e144b8a6c5b546dd3ae8372c788ea49646d101101fb9d8fa8ec"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ead987778a1c001d949c0bf948600abcbc52c1eb11156b82b7ea1fefbd127454"
    sha256 cellar: :any, x86_64_linux: "897b2fa5f13b07c7d46b5760fec435b54d83ff91d8a2c802f43db859d1b63088"
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
