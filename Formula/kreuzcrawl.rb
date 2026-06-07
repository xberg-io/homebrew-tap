# typed: false
# frozen_string_literal: true

class Kreuzcrawl < Formula
  desc 'High-performance web crawling engine CLI'
  homepage 'https://github.com/kreuzberg-dev/kreuzcrawl'
  url 'https://github.com/kreuzberg-dev/kreuzcrawl/archive/v0.3.0-rc.49.tar.gz'
  sha256 'f737e2d580e5eda11a4e3edb954bb284263450aa215021f6bfc490f4eb816bee'
  license 'Elastic-2.0'

  bottle do
    root_url "https://github.com/kreuzberg-dev/kreuzcrawl/releases/download/v0.3.0-rc.49"
    sha256 cellar: :any, arm64_linux: "e5a4b8161a75212c32ee53062df1ab2d5b9a64d07ffb4707a4577febb8f7a7f2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f3c0738dc627252c0b11636805eb584d39557348e92feda0e6b57c4e4c503f76"
    sha256 cellar: :any_skip_relocation, sequoia: "5d5b74aad92f0861ee967d799ec250b28284a41171598e00f0459b5ad8982865"
    sha256 cellar: :any, x86_64_linux: "c0d207e9798fc5e892dafab786f77983ccd3d9d1eab568038cf78e5c9af6254f"
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
