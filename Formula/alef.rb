# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.16.tar.gz"
  sha256 "57dfa9738feaa0319974ce931221c2cb01da1c5b29d5fba20cd081177f9c14b6"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.15"
    sha256 cellar: :any, arm64_linux: "719c9f809bb767d7a81195eadd0510d4c26c4b568e5c443db7f12722d5f8f650"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "efa15b2555b151f63852eb732c8f9d21b0783126bae5dea9237ad3fa0c554ec7"
    sha256 cellar: :any_skip_relocation, sequoia: "13158f5671806cec68945ef86b8434abc40ae1c91ecbbb15b983e58762d17ec8"
    sha256 cellar: :any, x86_64_linux: "a87e9df90a4d30f66e02f3db93e985fa5982eb05fbdeca597ebf7624046ca258"
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
