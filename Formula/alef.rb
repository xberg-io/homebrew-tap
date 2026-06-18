# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.44.tar.gz"
  sha256 "1028c64a9330e3cda55389b071d709efb87c60dd9b77f64f8381beb2335a4c38"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.44"
    sha256 cellar: :any, arm64_linux: "ad7fe97232d8befd0d67932ac0e6eb4b74c638467b62c02a77bddfa12291afd5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6b83c9a97702f6cd74012bd329b9a753b9d8072e541d49ba12364be417528a9e"
    sha256 cellar: :any_skip_relocation, sequoia: "360edbf8c28ae7e41a5ba82a217cf94930b5806c34081578beffe7664f6f726f"
    sha256 cellar: :any, x86_64_linux: "11ebedfb20095d51d4255530c95842a1cc9d73e9e4e628427ec76d752715c524"
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
