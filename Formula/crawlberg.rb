# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/xberg-io/crawlberg'
  url 'https://github.com/xberg-io/crawlberg/archive/v0.3.0.tar.gz'
  sha256 'c4616ffca67162a4f562c8d0bb50e6a28832dd58a8903ab2730a555792e47e54'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v0.3.0"
    sha256 cellar: :any, arm64_linux: "0e62b790acd56dc40c4900c83b931160badb256fb219168006c18a96ed6a32a0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "57d48f63454668b40ca4758b7d129b77083d8d4700fc46f5912c81bad3c1e9f2"
    sha256 cellar: :any_skip_relocation, sequoia: "da52857fa14884f30582d3c0a34b0ebedea45c696aaa3dcb975d321d2e233490"
    sha256 cellar: :any, x86_64_linux: "3378b853c15ba7dfa66df9ef4900f3c64dcdb90129b13ca5ad9f5f6dac517a93"
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
