# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.21.tar.gz"
  sha256 "6eaf1f562c8bd3f4f2d162a7ae8309ae188d67b0788bdb3dfc1f972e4b42a1e2"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.21"
    sha256 cellar: :any, arm64_linux: "07250ccfc9055b860318d1b48097cfc3b3cab8de5f898f1312030b4900195e93"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "aa22e5d8b86f00a86ee0c54d4f975a76084b24462ebe46fc9e6e859ba9caa4ef"
    sha256 cellar: :any_skip_relocation, sequoia: "624b727e42b5abf452d9ba86400261e7e1a8fdd068ea6c165901b0082488a45c"
    sha256 cellar: :any, x86_64_linux: "c3918264b1ddfef009c415114df3af4dad99ae14aabb0783e49888fb42713716"
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
