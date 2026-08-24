# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.4.0.tar.gz'
  sha256 '4af6fe22a56e1f6754ed93b5a0501fce774a7b8bffed35e668a56937ff3720af'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.4.0"
    sha256 cellar: :any, arm64_linux: "6119388c44c902d33b9ea9c1b8e225feeb3b7e4fc70babfbd1349f5d444d571e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "fd39c0df789a176064036e5a46a83bd9f3faaaf7c3628bfdd2b8365815f87cdd"
    sha256 cellar: :any_skip_relocation, sequoia: "622f36ca68f7b4b47993168f5aee91f934ab21c04020c71e8e39b3fedbbe709e"
    sha256 cellar: :any, x86_64_linux: "754ef837c36e05f2852b4beadcff14038031ca2f10113b7a6decfeca83c1ad02"
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
