# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.28.tar.gz'
  sha256 'fc3a736c4a189cf61f691f4496e760c51e60ab5fd14b7ac6d2c87cbab343da66'
  license 'Elastic-2.0'
  head 'https://github.com/kreuzberg-dev/kreuzcrawl.git', branch: 'main'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.28"
    sha256 cellar: :any_skip_relocation, arm64_linux: "cd07bfb2f43bbd5c3117d40c81911e5ee6bda0a8f22c634cb75130092d64d5d6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0127b12ef5c5c5ff6c34c3fdd08dbf7a16f593274348b6d997c2220a59bd8ad6"
    sha256 cellar: :any_skip_relocation, sequoia: "c9e364c27f0e105c1f5fc1efefa508c3b5ce738e38cf8f23cd08bc56576fdcb4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be10d9bdc7aa2a6adf874ff99c50358ee1eea6bbc7146668eb0d3f4fb3066ac0"
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
