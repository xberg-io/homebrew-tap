# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.51.tar.gz'
  sha256 '9273970504d46307c315314fd148f3518e215fb20c8a7078d1fd6a92f3b493ad'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.51"
    sha256 cellar: :any, arm64_linux: "2e0df9501021cbf4f594f947d56463ee9edc33ac5ce8918f18c0bc23eb59a705"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5894e28592a20e726975d467379781f93368b1e09335d15cc5e90c7a1b6612a3"
    sha256 cellar: :any_skip_relocation, sequoia: "be87cf3a37484d6c0d2c6113fcde5df62fe4e01caf5fabe6b6bb129deb2d61cc"
    sha256 cellar: :any, x86_64_linux: "3ff430d2d8f4a9d4e3f2af30275549860f8c03490d356b206e2249c8531e74a4"
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
