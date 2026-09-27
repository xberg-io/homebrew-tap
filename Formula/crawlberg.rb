# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.8.0.tar.gz'
  sha256 '218217e25b6f49bc0d609a4117437607e0ecca29ad91331cedebf49b16309bbe'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.8.0"
    sha256 cellar: :any, arm64_linux: "d401c4ec1a09435076a295716a0934ed29c23af50f16ab2cd644e2c2c18088f5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6d4e20ffcf786b8e574475f11a3f221d7e34f21f02e7906f44f27456633e9995"
    sha256 cellar: :any, x86_64_linux: "b8caa9efca620eb26cdd856eee7e9a11f6989615d4b7fccbe28c9aa98b88a517"
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
