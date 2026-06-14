# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.13.tar.gz"
  sha256 "28ecfb2bab73da8de769f07b0a620718a9521735bc3892fb30ce54f4ffb9a6ec"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.13"
    sha256 cellar: :any, arm64_linux: "1a0d78583a7b35c1ea92bc96922fd0a4a6e078afbf878f95098886fc41519759"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3e7867f6a21ddf2a5fd2f9ec96e14bcf3cd4f07991de437d0d8352310fc4eac1"
    sha256 cellar: :any, x86_64_linux: "b4cf6ee47510057ca0f46925893365915cf49e1d4ce28382bbe1980c9223308c"
  end

  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

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
