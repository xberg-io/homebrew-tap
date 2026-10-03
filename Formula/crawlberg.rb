# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.9.0.tar.gz'
  sha256 '83c480fc875a49df296b7c23c243cdad54c0a3d34e61c83e89dbfd505cb13519'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.9.0"
    sha256 cellar: :any, arm64_linux: "4695e2a84a9e6b28e107637cdc966bd64f084c8693f66c37a166b6ce0fa88439"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d5792406f7c5aa5f039d0d60d367be3f031fa3a29ff918e350cfe045cfc3b56e"
    sha256 cellar: :any, x86_64_linux: "a51e76129565f13cb2b743588f65fe46d6c92ee5030d3c5adc4b98f7c7516873"
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
