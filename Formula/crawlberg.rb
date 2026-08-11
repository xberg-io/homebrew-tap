# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.2.0.tar.gz'
  sha256 '7344869b6a0e85b6dbd49c78ddc42cd12580221bf011d25565f85e536a062f11'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.2.0"
    sha256 cellar: :any, arm64_linux: "9c7f2c4ba8bc0b8d741395a0906ce57fdeaeced732105c852737169e8261275a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "13b3c9e00ff512245a36f3d61ee59495490f54a367c96531500f7f52e3ac6fc2"
    sha256 cellar: :any_skip_relocation, sequoia: "4ef472829743cd006d180a7955100c30ba0ee7a907b65c1eb8570ab9a7f76ff5"
    sha256 cellar: :any, x86_64_linux: "c389b1d88f615defb6a878dc277e0f9bb55821a2a5c61c8a5aa336406ef7b95a"
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
