# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.74.tar.gz"
  sha256 "b7dca6e6bfd0b3a0f66bed1100456d444f486869d3a808cbf7ca3ac4bd3eb811"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.72"
    sha256 cellar: :any, arm64_linux: "02b4cc2603d07d1d4f23d8eccc9a2092035111c4306573f2ea9f3fc3d6876e6c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8a983f166425e4ee9cb228674974886140fe9e350d1edec16ac1d6a64d002f02"
    sha256 cellar: :any_skip_relocation, sequoia: "d3c6f07638a722e1aeb75616e5b0964bd68de56bccaf694e469a6b5a94ba649f"
    sha256 cellar: :any, x86_64_linux: "73f75ca5ab1462a7f8dc35d68bfed85d23556c816f0917d94d95722663fba949"
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
