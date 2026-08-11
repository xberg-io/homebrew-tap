# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.2.1.tar.gz'
  sha256 '7864c6e6901dcbc174ac48a7069ae53e2cf9efbecabfe1aafd5250e44fd90d14'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.2.1"
    sha256 cellar: :any, arm64_linux: "de466e771bf943c6f268a7594980b04a57687f395c6ff09d02e9de30f9489210"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ef662a2331884a9e1d21d04c7d64928011d8c0ab6e0847931ff65610614ed191"
    sha256 cellar: :any_skip_relocation, sequoia: "6421d161766ac79d805e3b103688f563a484aa890129c8e6cb7d0e4344f3e8e3"
    sha256 cellar: :any, x86_64_linux: "64a910dbdcb647d36d43984842752df14d7621f1bed8e7240b21f2b74c8ba127"
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
