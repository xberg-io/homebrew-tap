# typed: false
# frozen_string_literal: true

class Kreuzberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/kreuzberg/archive/v5.0.0-rc.10.tar.gz"
  sha256 "31084d9e77e4846fbabd02b101b2849ade298a54ae7067dea0cce3d2e7e0c180"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzberg/releases/download/v5.0.0-rc.10"
    sha256 cellar: :any, arm64_linux: "28442a4c24b4157d1b2af21d96e593e828a5929513d0ebe99a1ce16d49f05963"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0313233f060ffc7d2278e2fd56c351ed300090a62b263c27cf63d2c71489b65d"
    sha256 cellar: :any, x86_64_linux: "3c69dfccd8435550e43fbfe5595b3c7741e4af4c5ffe196a20a1ca8c980ea6e3"
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
