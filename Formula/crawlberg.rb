# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.9.tar.gz'
  sha256 '9887b4a699a2931f859653e025ec74b8db6edbcf290ff13217abe3c41231b108'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.9"
    sha256 cellar: :any, arm64_linux: "59e6b82f12bb9d69ae7ea63fda7249b802e5f2c85816d71ecea2fba278202cf5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4bbb934f35e973f0ffb29e36965cb46137a38505fc29e9d4d60bb890dbe01e7a"
    sha256 cellar: :any_skip_relocation, sequoia: "45bd132fed11c62d3bc1c49a96ad7cb7b78996ed8cfdaad2dd7a7f59813fc491"
    sha256 cellar: :any, x86_64_linux: "dfa6613b620087a23932c171c11bd7ac33ac0ed1964c9db5fa10ad2709023ba1"
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
