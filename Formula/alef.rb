# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.14.tar.gz"
  sha256 "1c7cab0101c5f3e20b309c5f46288a4db701b2e18f70eb562f0e80e2666f77b1"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.14"
    sha256 cellar: :any, arm64_linux: "fc6d899259f50326f7cf98a9eaab5fbc3cd2d5eb5e2e181f0ef17917f9c34d13"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b893ca772d8591d3031797684f848a2ad5c0d2338b10828dbcb7aa244e824653"
    sha256 cellar: :any_skip_relocation, sequoia: "d5378538239a2fbe007c582c0b186152039a3e4b01bfd1b3e521237cf0e84d18"
    sha256 cellar: :any, x86_64_linux: "0fae6cb9cb79045e005f844d657121517390c0dabe17602ce182cfe7edc16d26"
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
