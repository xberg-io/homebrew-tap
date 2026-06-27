# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/xberg-io/crawlberg'
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.0-rc.2.tar.gz'
  sha256 '14c9fdb6fc2c0341945e055faf8769fedcc3e660972a06767be33d0de05b5598'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.0-rc.2"
    sha256 cellar: :any, arm64_linux: "bc4a0e61516488042fd60a1af42d7a9961c4bbd752f56c2babab2240997b0ce4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "152089aacbbeb50779c29d06ab6ae3f737273519a0125a82827aa4ada19745e7"
    sha256 cellar: :any_skip_relocation, sequoia: "f2d8a6342c9b14dbaf679ddd736d82add57b16daffce2825e5949806ec558e12"
    sha256 cellar: :any, x86_64_linux: "c51bcf3ae35b8fb88f16c5f869bf2b687d0b284eed2a9875c600863042ca4656"
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
