# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.1.3.tar.gz'
  sha256 'd01f87e610fedf29974287b665f29c11f431417c37d22c842120491432b3a1cd'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.1.3"
    sha256 cellar: :any, arm64_linux: "96ff46b1e3ef2c5eb0a6fe243b893de2a812a73645f573739cc94c24cbaf7b5d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "bf7c76ad629285e26a56d055749e6f1b490b3b24f50decdc35487099e9ec4a50"
    sha256 cellar: :any_skip_relocation, sequoia: "70221546035fc982a943ea0f10a409751f18525db91dab2276a66fcae475a97f"
    sha256 cellar: :any, x86_64_linux: "d2f2c9b9c18d13d2586550cd023a2d96cc911741226d21c5807771d08c024296"
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
