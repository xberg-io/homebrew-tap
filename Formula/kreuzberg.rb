# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.27.tar.gz"
  sha256 "693a77ce230ea3810a8d3af8bbb632f1898e8b102dc80a9a46a9a9d16ce7145d"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.27"
    sha256 cellar: :any, arm64_linux: "500e40e5e7594714b5f2891ec414549410705fa068eaa1e556a5b61a9a470e37"
    sha256 cellar: :any, arm64_sequoia: "83d83668e8acd9a37cf522164884ef725ac414ec209cc7cd2daaddaf7d896152"
    sha256 cellar: :any, x86_64_linux: "3dbd3b99644c4bc2aa060b30e890c8453ff11032448c0808109ea116ebd8dca0"
  end

  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build
  depends_on 'libheif'
  depends_on 'openssl@3'
  depends_on 'tesseract'

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/kreuzberg-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
