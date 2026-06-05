# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.43.tar.gz'
  sha256 '69c60df0d1866152a67997276121fa19a7bf9327d7a6169d74fb902c94ea1b68'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.43"
    sha256 cellar: :any, arm64_linux: "d718882b0c99d5049b471d9607e178668798615da491e13bebd66a2670326675"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "65fa5264c851be6d327c11e6a47947229acf0d5e3a7e03ab79163a991c4bc8f0"
    sha256 cellar: :any_skip_relocation, sequoia: "c51a58a6f35ae453e4d5acf0ebec2bdb34837fbf78855d61ed0b5777eebf09e3"
    sha256 cellar: :any, x86_64_linux: "6a28f9eff130c2f3530863727551241fabf977104696bd97277c291196f4ef23"
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
