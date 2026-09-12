# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.6.3.tar.gz'
  sha256 '24020aac9067d63d4dfec6264d84676daafccf3ab6859eb7addfbfc258b6ecb9'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.6.3"
    sha256 cellar: :any, arm64_linux: "37aba4dedf3dc763c4cc4c4a1c2c94e208e20c638810f7c86b54a22fd8f69804"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ef8e0e0ffe5eb0584081e87250ab61a3dde89ed55a4c7bd503ea6c49b10d96be"
    sha256 cellar: :any, x86_64_linux: "fb4f2b77f2c5198c122f82a64c08a27ae7c50c38420b023aabd7ebc240138ec1"
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
