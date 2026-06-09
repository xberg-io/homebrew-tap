# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.70.tar.gz"
  sha256 "666ee50b9393ca9e6fb8e44fb4761f4de28e618967027ca5a9ba91472e4d3315"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.70"
    sha256 cellar: :any, arm64_linux: "28564e2b352976857b1ec98be20df18be88c59aec50c922808ca5694ae5c0b8c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b26b290c49de1fd5f7ddd00e4c372c06a6ae29d51335873a657d860e13dbc431"
    sha256 cellar: :any_skip_relocation, sequoia: "e2543cc474e6ac804e7f6d8f2bf94078d68f964a1cf4e887f28c788aef6fdb70"
    sha256 cellar: :any, x86_64_linux: "fdd5d5f7f6cdef2808b8462cd3bafd1ef75827e48cc75d61d4886dc8fd095589"
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
