# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.33.tar.gz"
  sha256 "94da88bf5b68a3cf502b65fae90801d925d4482b622d0a195a35913ebc4b4eab"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.32"
    sha256 cellar: :any, arm64_linux: "a1f4c32a12371f17e7b1190c11153ffeb7e71a64429f961447d42c4181dfa702"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a9e8bfa95865c8a345e8d5a23443cc0c954d0826dc0cc40b342f9dce7228e2d0"
    sha256 cellar: :any_skip_relocation, sequoia: "87e533dc8ee51a7a3732ae223ab3f7d7d411232f74f51efede2394fa3cdc15e5"
    sha256 cellar: :any, x86_64_linux: "5ac74767f6813d471972760504aa5cf818b57d07dc0b91020ad58faf528d255f"
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
