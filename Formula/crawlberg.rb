# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.4.2.tar.gz'
  sha256 'a1fb2721e7b6ad3515c89b8bdd45dec7de288926e15caf22c196a73daf2dd4a4'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.4.2"
    sha256 cellar: :any, arm64_linux: "901486e2c38ae92a81257b926960b76406b76ae514e4c7e95dbc49e142c3f2b7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "bd78ce01b772249913d1138ef2b94dc387af1f7748f7bd6a5d53b51a4c01c8ee"
    sha256 cellar: :any_skip_relocation, sequoia: "ad101c5479013f9c623ecbbfa32a6ea9327d7dab5ee3f407245593a041793546"
    sha256 cellar: :any, x86_64_linux: "fa9e27fd328c3da5057243bd4357b5a54e36afa432e8b976b10526f916e2927d"
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
