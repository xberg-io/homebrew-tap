# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.1.tar.gz"
  sha256 "c541afc3592d763759bdcdb23e979f7790c37a73fba0625ce0dd6cc3da9c27d4"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "f2615697ac4e7ec7b62ea4af0d5f00a57ce14b7f8af175baebc556856625101d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1e618b8d602a37b0409e17e2b934912fc349b5054d1b718ffc1c2c834828a9fc"
    sha256 cellar: :any_skip_relocation, sequoia: "0c9045c1cb0c7be270f381de315c311d08819d66d06d06f2da22c0648244aa21"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d26a5aef8c1c73e1027dd0206410def7322a78001acc69a703236bcc55d4b5bd"
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
