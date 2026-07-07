# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.10.tar.gz"
  sha256 "693467345ef36e59ae680aae384db3ca05ba9963228510a4fff6042e3db79678"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.9"
    sha256 cellar: :any, arm64_linux: "e3161da705ab11b8d33aea67d30428a1379b51e964b7ce19c226d95d7fc0e8a3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "62dbe30ee2ee25a54d201e87225ccff756883cd8b79ade762b980c2348886363"
    sha256 cellar: :any_skip_relocation, sequoia: "8e93484899ce2f6b4cba53e21199c24b74ef883e2fa95e84c1782e472c9a9f9f"
    sha256 cellar: :any, x86_64_linux: "108ac5679d73a26d25e3ad66e400465c03791bfb57326b89102dd5283f6bcc50"
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
