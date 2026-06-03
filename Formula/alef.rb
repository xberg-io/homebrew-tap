# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.20.tar.gz"
  sha256 "f93203346908a1f4a493f451c73d5c468ee7bd81f60640d4556d3977da8e5d19"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.19"
    sha256 cellar: :any, arm64_linux: "5f5f946e7d4a4dd4f9d0e413bd2398f60d2dba7fa141b07f3d32e41a3c3c3e8c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b3987668a0db06db30bf8e28859922ca7f949eb02383945828dac4b36cab7f1b"
    sha256 cellar: :any_skip_relocation, sequoia: "6c3554865f28bda05482c943fd463b1e3ff2aa501589bd545ff0f4824d981040"
    sha256 cellar: :any, x86_64_linux: "767cb2af8cdd6189151dfd304a944ef3c59f061eadc0463be8bc9874b1f19ab0"
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
