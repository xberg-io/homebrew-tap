# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.19.14.tar.gz"
  sha256 "cc3f3b21c2bf3d8645475d6390400c7cd36db86d0b95432f97e9fb7487bdb5a6"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.13"
    sha256 cellar: :any_skip_relocation, arm64_linux: "0a49b34725937450c581744c27b51342e2bb5478187ef184236b3e1b82d6edf1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c86f5f09599fb999775448271c1f44f720e6f9fa27648607ba4522d4f19e4da8"
    sha256 cellar: :any_skip_relocation, sequoia: "e2f95fa35616c7592179041fa3ab931eb44fa7cd46c9cf100f04a684e3958d2d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6933104c4d09b2193a104a90524abde403594fd1152e321f2faeeeb83625e6ad"
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
