# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/xberg-io/crawlberg'
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.3.tar.gz'
  sha256 'a8be5cfe43d3b61cde882493232a7362d628e0934a9cb30a6a8d393896730e03'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.3"
    sha256 cellar: :any, arm64_linux: "da8a48ce9b370db1e3abd85f048ef5ed1006c3741b1a39e6e944173b2ff90f93"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "537d6da49facc106744ac40c70c43be05b40e84a8fdba7c5dddd4fd8714213fa"
    sha256 cellar: :any_skip_relocation, sequoia: "1b7c100f46f11a7a755fb06020a1e757aed788d98f1951f4ae2058feb03a7e0a"
    sha256 cellar: :any, x86_64_linux: "0f11ce9b386942068b07cad92627a393d2faee0449af374704d859d66afa33b1"
  end

  head 'https://github.com/xberg-io/crawlberg.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/crawlberg-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/crawlberg --version")
  end
end
