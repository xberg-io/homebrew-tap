# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.78.tar.gz'
  sha256 'b42453966cd2213e64d105278f48b0a229ef4aca9adcbf13bf379d3914fd3cf6'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.77"
    sha256 cellar: :any, arm64_linux: "02da7f73ede8a16ce1be40720f43bf8efc0b3ffae0d1997a258bccd47cbf23d1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0cb39b01a20a38f46f7db7d12e5d8a20259b023e8577ecfa0fa775d42e591c71"
    sha256 cellar: :any_skip_relocation, sequoia: "f29c657878b87f4eb6262d7b66ad1f53bba5e6873ba1fc2d26ff837db559515c"
    sha256 cellar: :any, x86_64_linux: "7eb8c1104e68c3a88dfc80e21ac12aa09453881650921f2e7eefb7dfe7579d47"
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
