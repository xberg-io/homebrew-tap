# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.45.tar.gz"
  sha256 "5e65fa42f614a28d5da2c54768a165ee6df95b3e335eb29a8e8deb1d4e08242f"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.45"
    sha256 cellar: :any, arm64_linux: "9708302dd4ac03ac01f6c4ecabfd6f3a4dca61967ef001cf72be21fe357cbe90"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bff03caabecc8a0b36623e287f78442ceff6ab420866dfb90e659e04a234447f"
    sha256 cellar: :any_skip_relocation, sequoia: "5afbbe74b36fb60e94be4a8b26193aa07485a090c50826f235bb33a8d4f46b32"
    sha256 cellar: :any, x86_64_linux: "f032663f232c342e0396a3b759826725d65d628dff5bfdb216997fc4b05beb51"
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
