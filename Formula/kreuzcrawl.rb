# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0.tar.gz'
  sha256 'c4616ffca67162a4f562c8d0bb50e6a28832dd58a8903ab2730a555792e47e54'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.88"
    sha256 cellar: :any, arm64_linux: "846d8acdd326ee76cf2c552a76c0a66a9ca6c803c4856109f2a2c21665f00579"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d37605d97ca18c078b1e915530f48650caa977e66cfaaa237189d5f54471bcbd"
    sha256 cellar: :any_skip_relocation, sequoia: "d3ba4c5c67fbedfb1f9464937a25a4897edb99aa9089542d591844223db26cc5"
    sha256 cellar: :any, x86_64_linux: "d38227d105a6a6985d0640b620de0202bb01f40030e69545d6d0fae8ddbc84e9"
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
