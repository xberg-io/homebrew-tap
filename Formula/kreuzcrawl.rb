# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.46.tar.gz'
  sha256 '4a2d5775b315ff9df817922bd9a2ff39f0742500e7a8121d6a6396eb813d1bb8'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.45"
    sha256 cellar: :any, arm64_linux: "9b8de8f7396c181ee0f4b1e068eab0db785f131f6070c380309ce3a4807f6792"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "10e6886474988b721066507dbcd0df48e55b4a6e146513c21d2815345fa89f49"
    sha256 cellar: :any_skip_relocation, sequoia: "7f8b4f781272c23aaea58341185e8c35efd4afda8e106133bd00be68b9bec82b"
    sha256 cellar: :any, x86_64_linux: "be1ce4e63e1fdcd78725de7778b36e26af348500fa6fe5e4e363ef26751360da"
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
