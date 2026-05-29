# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.12.tar.gz"
  sha256 "2cbc637b3145e520bc39151dd17beeb3e7562bd86d60c787d636714ce1b4c255"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.12"
    sha256 cellar: :any_skip_relocation, arm64_linux: "194060eb740400c5e67f5576f48817f412e0c4283e38d4fa7a37dbb0c39f1519"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "442263605c80dd07bf38f71b6465dcaa2b4f93e0bfbc445bc46e2b9196f53e7c"
    sha256 cellar: :any_skip_relocation, sequoia: "b537f11b3c62889116acab7a3f829a5ce4e0beeb84ca2c62cf12fd07bac6b3f7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d2cfd215c2fec409eb9478828b7216b95c8428c8b3a6e63d7fc6d04a38d23027"
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
