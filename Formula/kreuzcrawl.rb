# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.70.tar.gz'
  sha256 'c66b55f2e3fe6fc375755a9f42481e0d67e9a18a7fb047986a9ebbdf7e16b829'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.61"
    sha256 cellar: :any, arm64_linux: "d9b37c3c140b4e2f08a53982e839fd4e76d5b2ddc20c982d36e968c289347f45"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8db04e1d694ee0113484404cbaa973314789c7e67baf8e0a96b81ee095ed49a6"
    sha256 cellar: :any_skip_relocation, sequoia: "09fec6eaedf9c60f5e57f7d418184237c90f72b79b3b79ea160cd87105142a59"
    sha256 cellar: :any, x86_64_linux: "158a3217ba8ab0ae6aa7d51320da2794bc6c722be6e85c52a6b73e9b193b63d8"
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
