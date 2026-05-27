# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.35.tar.gz'
  sha256 '4c837bf0ac2aa25385f976ab3b7e8c86a269ce769f492da412bc69e77bc9e314'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.35"
    sha256 cellar: :any_skip_relocation, arm64_linux: "494d63d9413e3addbbcd9513e7c8b0ff9e965f9949ae20b9183fa6215030de80"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d3516c902103528adb7d9214265cf6e7d3578d1504d426e09198441dec2269e5"
    sha256 cellar: :any_skip_relocation, sequoia: "dc795109d1d2b83f3aacfbdc44bcd9e2daad24b40342424de93308e51a33e2ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5923916698dcd7f82a8cba36d72bed793da15df88f1cba466629e12255b4e090"
  end

  head 'https://github.com/kreuzberg-dev/kreuzcrawl.git', branch: 'main'

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
