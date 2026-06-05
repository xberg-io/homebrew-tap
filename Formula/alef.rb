# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.10.tar.gz"
  sha256 "edeaac8784e752e2daf5593033843eabf2c831690dfddd36b167f047e22ea9a1"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.9"
    sha256 cellar: :any, arm64_linux: "5d89452953ca7a570876f894fcf030586753c2025470955719bf6260759bce29"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b4ece44280fdad7500307e503ecb7df3e3bfa4d1a4e20a6c6451687dfc67b505"
    sha256 cellar: :any_skip_relocation, sequoia: "fc623a339ae22adc216a4672b468f0abe31840ac09ba89fe76435fb25198873b"
    sha256 cellar: :any, x86_64_linux: "bb4cbfb014012c5e4e8edcaca1ce0d8b4bb15695cc66da019b33cd78c1e85b78"
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
