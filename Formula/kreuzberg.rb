# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.31.tar.gz"
  sha256 "772f365e2d13e51fb523688c361e6b4bf92d7a96fe9a0ee98072d0357b633488"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.31"
    sha256 cellar: :any, arm64_linux: "b5ea7ac67a77203a860bf0435d18bb70a477ea77f7c56a92f03f873d1650e38d"
    sha256 cellar: :any, arm64_sequoia: "789b0cd3f4432415bb86542bb67e9770fbc02250830274b8f2648a2d93127b9b"
    sha256 cellar: :any, x86_64_linux: "f5ea20d29d109363db494163130ece8378448944df724d8abcea54c9dfe8c78e"
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
