# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.47.tar.gz'
  sha256 'c93a5f7b7245a455f683612412c090c4e1fef4ba2b2ffd3f5ea8f9ea02191279'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.46"
    sha256 cellar: :any, arm64_linux: "cb4473670007e09d7b8a543ee92e2411750268cf6d9ea943c0d33e910ae93fff"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "312fe69d674327d75643d9c4b6268c3177c552a7edf5e66ce32743ed8e63fa59"
    sha256 cellar: :any_skip_relocation, sequoia: "a7cdd9bb263021f5dd9a513b4834d0332fa8a4f935dbbbdae7ffdbb8b3dde42a"
    sha256 cellar: :any, x86_64_linux: "3faf3bc0330a7899838956bd2f65b08fe772049a09795e8e2aef5589246f2328"
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
