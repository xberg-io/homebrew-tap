# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url 'https://github.com/kreuzberg-dev/alef/archive/v0.19.11.tar.gz'
  sha256 '7f8f234e943eabf43a6d0c7269cfb676ac107a8d358555520a63349c56758e07'
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
