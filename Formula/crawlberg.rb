# typed: false
# frozen_string_literal: true

class Crawlberg < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/xberg-io/crawlberg'
  url 'https://github.com/xberg-io/crawlberg/archive/v1.0.3.tar.gz'
  sha256 'a8be5cfe43d3b61cde882493232a7362d628e0934a9cb30a6a8d393896730e03'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/xberg-io/crawlberg/releases/download/v1.0.2"
    sha256 cellar: :any, arm64_linux: "5535026272d370c55bd6f39e58b3c1b65f92378b06f97bf37b60bb37573d396a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0c297071f58774f39562b24a982c9b1ceacb88db1c1e6ddfdc901f644b03d2d3"
    sha256 cellar: :any_skip_relocation, sequoia: "8f2db0259723ce31ab0fc64724799e7061c41e6176273f9392c59e32cb513ee7"
    sha256 cellar: :any, x86_64_linux: "9edc56d73cc012458c5ca65a1be8db8647cb9afb508bda7134a7519659d794c4"
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
