# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.17.tar.gz"
  sha256 "53487e14d7952eed8434da7593bfe08ec0594b067754708d93804fbaa088dc24"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.16"
    sha256 cellar: :any, arm64_linux: "eaa9532edddd222deb1df0a0b968a462a607bdff3e39e243424ff98bc65e7e84"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "49efd62ed77f8c9ecf150e40d27009c437af0a6b44fa29fe69286818cf366f38"
    sha256 cellar: :any_skip_relocation, sequoia: "46b8c6d2714ee0a597fa54babb49c58f17c27303f700d7eec28ce429f001e2d0"
    sha256 cellar: :any, x86_64_linux: "3bbf4f77433bf68d8ce39ea6e7878663d8110b0bc4be2ba2c4951ea218900fa7"
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
