# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc "High-performance web crawling engine CLI"
  homepage "https://github.com/xberg-io/crawlberg"
  url 'https://github.com/xberg-io/crawlberg/archive/v1.10.1.tar.gz'
  sha256 '8f209729ae00cdfe9469e85588c4220b5f4e95436ca55ede858d447bdf11e7f8'
  license "Elastic-2.0"

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.10.1"
    sha256 cellar: :any, arm64_linux: "c007d70b748cdef3c68df8e58a4da21008e47cae638f82cd1334bb96ee57ddba"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c7077a3c945c3d156a3902805a31bfb127e3a3da2270e0c10f4fcddc66101eac"
    sha256 cellar: :any, x86_64_linux: "505ba84806f7b9e8c27bdf5cbc80b89f26aef88dda7332c10c189fbcd320fb71"
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
