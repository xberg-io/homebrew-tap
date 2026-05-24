# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.27.tar.gz'
  sha256 'ab0c86d6c8352652952267f239805a4adb802a6fd344872996e711cccaa2631d'
  license 'Elastic-2.0'
  head 'https://github.com/kreuzberg-dev/kreuzcrawl.git', branch: 'main'

  bottle do
    root_url 'https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.3'
    sha256 cellar: :any_skip_relocation, arm64_sequoia: '129576b74a651bb9fb71ba33acc7c7cd38876c07db59d22f70230369603f85a5'
  end

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/kreuzcrawl-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzcrawl --version")
  end
end
