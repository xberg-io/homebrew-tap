# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.30.tar.gz"
  sha256 "d43fd5459669bd029d06b472f551ec8f9e3fdcba866350e00568493dc2caa14b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.30"
    sha256 cellar: :any, arm64_linux: "be3eb7239182f02ee8f8716c08da63af3cc8e282ffa3442c2af63abefb8a5f33"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e7976f92708311b17f7b8a7a8edd5100d9f9ae4ca801e4a8b8b9c2930e018cc7"
    sha256 cellar: :any_skip_relocation, sequoia: "238fc0eed628733d3457a08d1c7fe74617135f48ba00c27b0656db20527428e8"
    sha256 cellar: :any, x86_64_linux: "9d72cef2819fbb03ce13accdb771dc8dc7ff4cfe6ca659fb38bb6acaa098edda"
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
