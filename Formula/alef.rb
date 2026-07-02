# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.9.tar.gz"
  sha256 "7564dd6d77a8f2c1097589e6e5ac69b2c29a61868bd45644be5ab7744556ffe7"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.9"
    sha256 cellar: :any, arm64_linux: "78f1e62fc00aeba8e55724b7fb351bb3e23436918c7e734657ce7d866257300b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1947c99d6b3991fed5ae34f29709d9dfaddb5474d62b7ce834a7fa106bcb2ffd"
    sha256 cellar: :any_skip_relocation, sequoia: "adac20777677924704abc934e7c66eb88916d226798a446be5b6d68a7631c42e"
    sha256 cellar: :any, x86_64_linux: "f4c77f0a063c971d8b6c3ad5b197f408aa595bac48c9fd267f0c0bef2d46876f"
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
