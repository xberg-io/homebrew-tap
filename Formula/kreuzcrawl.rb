# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.60.tar.gz'
  sha256 '22054141c1cb1007aa03e42fef316c8ac2ee45bc7d658db7c930818be7d92427'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.60"
    sha256 cellar: :any, arm64_linux: "4d4dccdc6508b227ffc797fbb616519c718c9d1782cb21fd651f7c3b75ffb278"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "27cffc7d4e48857b2c6bf44bc20db8400e4c755b759f28c774dfe62ac46a659d"
    sha256 cellar: :any_skip_relocation, sequoia: "ee9aac9942113da41780b454f35822da7409edeeccbc98a368af5a58f4446564"
    sha256 cellar: :any, x86_64_linux: "a1747a8db0ff36e6a6e3af3dde17e55c5aeb4c796028ad8a49c38d3e87b5d56c"
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
