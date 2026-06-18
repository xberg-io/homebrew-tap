# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.78.tar.gz'
  sha256 'b42453966cd2213e64d105278f48b0a229ef4aca9adcbf13bf379d3914fd3cf6'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.78"
    sha256 cellar: :any, arm64_linux: "214c910e4310e007050b9b2a424ab0a2f5df67f8dac8284a05dc2db78d8d3fca"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "973c184a99fd28e07aed013bf20b45a296bb3800939f42374f3468d7a70ff527"
    sha256 cellar: :any_skip_relocation, sequoia: "0324e88bd3dd035198a558229d20ebfb7973c4a8f4057d2d27d7724c48ffe836"
    sha256 cellar: :any, x86_64_linux: "2fab8e9ecf4bd1523759c8af125a7b4b3c3587bb80644766091635956572a9a6"
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
