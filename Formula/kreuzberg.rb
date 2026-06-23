# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.30.tar.gz"
  sha256 "f02b27bfa6b4d75ccb6a22c08f620a137064acd4e152ca566f39c9866904e1d9"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.28"
    sha256 cellar: :any, arm64_linux: "3031b5ce4b4554149c33cd9a430c4f63d4e81c0a20fd8652e664852c4ba84069"
    sha256 cellar: :any, arm64_sequoia: "464311d8868cebf5721f3a06382bfc0bf680a3b54a842f0d4d97677a462ef2db"
    sha256 cellar: :any, x86_64_linux: "b503750bfd53e2e3cde2edcf10961a7287c79bedc5e56b83bbb0dcbbae932794"
  end

  head 'https://github.com/kreuzberg-dev/kreuzberg.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build
  depends_on 'libheif'
  depends_on 'openssl@3'
  depends_on 'tesseract'

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix
    system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/kreuzberg-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kreuzberg --version")
  end
end
