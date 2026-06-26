# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.29.3.tar.gz"
  sha256 "e5a13690746a892c093cbf917d801e6ba88376cb2d5c86559cf041fbe0130fe4"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.29.2"
    sha256 cellar: :any, arm64_linux: "b9812db62941d037aa7a9fab6c2dc3596a73bd99d53fcb5a9b3a24231faf12c9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c5cf29d95446c025475eea25121634a3953cee31a72de9dc711298be9bd23bb8"
    sha256 cellar: :any_skip_relocation, sequoia: "1b79234e0c95b6a6d41f52fbc3a9c883f54602fc70dc5515947f564297d7a1f9"
    sha256 cellar: :any, x86_64_linux: "dd377465cee894a3f8d8affd73de28fdfaf0ddb8a1379e540ef30a792eda0534"
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
