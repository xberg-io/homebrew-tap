# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.1.tar.gz"
  sha256 "6a51d23f872769eadedb505ab170882a7ad33b0e73dab9c8f0979e2c108a1282"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.1"
    sha256 cellar: :any, arm64_linux: "a013d9e54f5940c2765a9a4f279166ed5bc0331910132e188c095e1ff9208f20"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4c4df849588eb36da6c7241c3de4f30aaa8f44da11b390c1e949b13c111b91b5"
    sha256 cellar: :any_skip_relocation, sequoia: "c5655c2a95819320d9754613f3a82527d63134609ad80ea8ae3fbdb2fbb9b6ed"
    sha256 cellar: :any, x86_64_linux: "8bb358663bda5fae52f5c2b5180d268664d7a5040c1f58e4661ff0e8d03bf6e0"
  end

  head 'https://github.com/kreuzberg-dev/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
