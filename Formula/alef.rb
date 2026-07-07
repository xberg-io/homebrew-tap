# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.33.0.tar.gz"
  sha256 "a64129ff27997a870a8aa488f915974320c75c2573b43fcc2069261c2f667ac0"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.11"
    sha256 cellar: :any, arm64_linux: "bb8f384a24e27f326ed487c848939fceb856020528d48f5b08f750d5c12cd5d7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a466626e06c30675d80c290cda6bf3b498a368f65bf0a5f95491e27169718400"
    sha256 cellar: :any_skip_relocation, sequoia: "fafcfde5d7e83611f6fdda28247d996d4726b7b13ca64cf3303225080aff63bb"
    sha256 cellar: :any, x86_64_linux: "ceea64cca0ff952ceb3f8ea8acd582f3e5a4d1b590f0491ed0d76c8f00689ea5"
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
