# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v4.9.6.tar.gz"
  sha256 "5f2bbc62e8d3e8729cae976f9e8d728f9d1fcd052db34371582dbd67d2c57df8"
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v4.9.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e2174d99212982f17e6385eb6c91ebdcd7e64b14dbaca8bce28da2379076c92e"
  end

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/kreuzberg-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
