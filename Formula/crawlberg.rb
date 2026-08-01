# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.1.2.tar.gz'
  sha256 'fc58907432a05322c6297eb267aae4c2a8446a66c5e609b1fe2807af94996fd8'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.1.2"
    sha256 cellar: :any, arm64_linux: "34ba17db920ddddb1accd760eee089dc9d92bc0e857b57738a5d149f5a98b309"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4f851f653ba85f6cd324a90f01f30a7edd2b0ffd02b866f27144fe35ac51e7c3"
    sha256 cellar: :any_skip_relocation, sequoia: "719d06d37e3332afae4bdcaf9f246c8890147a1eb4e465338bedf2fa0051713d"
    sha256 cellar: :any, x86_64_linux: "b66329301d581cffbb776986955d86bfe4682b0882958e6841ed01f56d4a4a5f"
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
