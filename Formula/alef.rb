# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.5.tar.gz"
  sha256 "cb503223e04245c6b0f6842874879c361f3798cc3a45fe542d59de78fb0b5a0a"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.5"
    sha256 cellar: :any, arm64_linux: "20ea1625cb25f7e07a1e26b13be46dbb8e18975627690f4f182ff58dea5111cd"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9fe77edb5c99f68c3d729085ed04ceae564cade0b63cdc2781f9701fdd71b118"
    sha256 cellar: :any_skip_relocation, sequoia: "db4f5476dc4772118d3b2a1c03a3aff19f6ece006379ae9f61702c1a35704afb"
    sha256 cellar: :any, x86_64_linux: "2f06e1c503e4468dc5dd93424a96fbaa00c28ec2e030eebffb917f35973c6e8f"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
