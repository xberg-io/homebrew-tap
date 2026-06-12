# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.24.14.tar.gz"
  sha256 "0d8d77ee629cbedda8df98a0f374ce08ef75ef2e0d21c4c6a3510bc52200f055"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.24.13"
    sha256 cellar: :any, arm64_linux: "aaf8195f0569ed1e1b4abfb144e2cd9f94d8c1588537680ddabd9273e47e9afb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5b225cebbf3ee5f6830975a1e215f40ecf5954e6f7d9799ee566ea275037b6f7"
    sha256 cellar: :any_skip_relocation, sequoia: "cf32ceac3b0929e4e4517f69b3e0f7975231b9bb99c27bb06febe9339f6f3641"
    sha256 cellar: :any, x86_64_linux: "661d5f9da784008bae77217aa552bbb9fd6893a3f7c67969d6fa9cfdfe4a913b"
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
