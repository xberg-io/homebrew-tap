# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.5.tar.gz"
  sha256 "f4ee02998c987e6a4450620e68edda85084303a9f0e623596b64ff77b56b29c4"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.5"
    sha256 cellar: :any, arm64_linux: "6449ab80208f0c0d36055d175117dcca81b6c0568c6c83b0ea50153833f775db"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2f927c8ade7829e4581673cfdbd88ebaa0c7b03f64e5b3f212314de1562a1fe8"
    sha256 cellar: :any_skip_relocation, sequoia: "4ac6b429a53b602f2573ba761ecc941ee5baeb177fe6bc687ff03410b4f454a3"
    sha256 cellar: :any, x86_64_linux: "02c29be98b533f5ae5c0be4bee1c89b69e849543c7c222b17a1496b7ee087fbb"
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
