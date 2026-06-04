# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.28.tar.gz"
  sha256 "3513525bf649e829e977caf1f8edd14fbb99e0083060b57aeb7f080019a6100b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.27"
    sha256 cellar: :any, arm64_linux: "44e682a18e5280a1162ae2cd5c6094d9fb169a1cd3368adedc2b6182a3b10fe9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5bc9b502aa33dc8fbad722ff9021aaf52d6b6a8f42af8a6f625c4222bbfa9d4d"
    sha256 cellar: :any_skip_relocation, sequoia: "5950e655e12d885df53f734033709cc6627801ff105a1fdbcfe3f0989c00054c"
    sha256 cellar: :any, x86_64_linux: "438b10d33e2054a9da9a8fef3df0b4b9af44a1b6848b462f61f8ee033cc03099"
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
