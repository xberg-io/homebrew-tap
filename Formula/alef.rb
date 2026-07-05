# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.5.tar.gz"
  sha256 "f4ee02998c987e6a4450620e68edda85084303a9f0e623596b64ff77b56b29c4"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.4"
    sha256 cellar: :any, arm64_linux: "bba1a9af994fa098626ee7111bd4262b982f2b216b8fb12bed1302c48f74a33d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1825571d0fe55d1dab3b7ee68c93d6b4ee3b34a5f05486c2a959f25949561e50"
    sha256 cellar: :any_skip_relocation, sequoia: "6d9b3f78e602c14e00babac87f8879b61d51f7ac31530e958950a9c9f578a88d"
    sha256 cellar: :any, x86_64_linux: "7dcadc45993a5fc02cc3e44218f699ec9eb8e0d78e1fa6c21efe97785a3630a9"
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
