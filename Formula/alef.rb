# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.66.tar.gz"
  sha256 "80549772564761e027ad9b2ee663b7b272dd7c3e4e94547fe4b191a34b0b5686"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.65"
    sha256 cellar: :any, arm64_linux: "051f1076fe69d78287a234ce687be34fc91a3aac6c59f7f7a1cbdf07ca1c91c0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fcb29c22d8cde80044ee6c3a228d548213c36d9586a35c7bac3711d4c222776a"
    sha256 cellar: :any_skip_relocation, sequoia: "3375ec05adea7bd55f1a358b6161ade97eca9634c9ccd0eeb315c917bf839453"
    sha256 cellar: :any, x86_64_linux: "37b49c725a3ff5d23ab513c3bb9f411b30032b3793cf00f52768a9041c1d2b46"
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
