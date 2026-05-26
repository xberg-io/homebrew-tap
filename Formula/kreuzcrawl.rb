# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.31.tar.gz'
  sha256 'ae54e8d6ddb1e8c9de3a64ebaded49526a4505b19830e40baaede7ad17b04230'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.29"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ba7181b9db14ad9a7527210930c6b333e731baddd70e8d3ee3325719c43cfc6d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a4b761061a83d9325d4920983019003b4130052d1e87e89dd528b524c8bf8380"
    sha256 cellar: :any_skip_relocation, sequoia: "9dad94fc642c058431b7c4d5fcf267ead247222dcd2207b546d9bb59f86d3390"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e578dfe5a94d224687927f4783e785c1970b236319e57719f3a2a4a03647b0e4"
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
