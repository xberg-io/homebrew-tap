# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.15.tar.gz"
  sha256 "5c46d4396ec4f891adcf974d4cc4e39f277bbe634222c257ec40d62516fcb0e7"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.15"
    sha256 cellar: :any_skip_relocation, arm64_linux: "08a55cf07c3565eebcd7cdbd9637945d64606a832de3595437ab22b1efb3c38e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9e7651a374a78bfa822424d82ced9cbd0a3b6d00d8de47ccad210f3978ae6455"
    sha256 cellar: :any_skip_relocation, sequoia: "e42bd33ef32a44b0ca7a5ad69708af19c17dacebee83985e2fee4aef6d2fdf00"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f431d188d0db08bf7c5e8bf73f5de95db70bbae6709ff2902b7e941c5d648ec0"
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
