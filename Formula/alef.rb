# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.48.tar.gz"
  sha256 "322c32a8deb3cca8a695fc5fdcd38ba392ebf7f223a80d04a75f6de23ece3671"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.46"
    sha256 cellar: :any, arm64_linux: "d59debf9ed274979579204b7489ffd886363946042b630228415181f0938c1c6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2a9176189cff11e0f48cc68f034f144ce7a94cec3e57ea3a860691bf02589f69"
    sha256 cellar: :any_skip_relocation, sequoia: "3b1246c0fc9a50a550ec854b37e365b1151104cce0868d312d2adf9a6f772fa0"
    sha256 cellar: :any, x86_64_linux: "093218337ace5c59db3654a9f3b4ec322015e8c086af4202eab88e71b855108a"
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
