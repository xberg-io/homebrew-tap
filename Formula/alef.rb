# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.31.1.tar.gz"
  sha256 "2d85ab761d761ff439250861bb1f0bd421341edf06b207bcbd13399045d73840"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.31.0"
    sha256 cellar: :any, arm64_linux: "3873bcca3236d229c7bc0785f8343462db4aad606bd3f85e7e8a6f747551614e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "966366e6618ccf532170964de84af4d8df1f8aacde676baeb8cc3676d9a1b9db"
    sha256 cellar: :any_skip_relocation, sequoia: "62d93353cdf08a46e3675d4c43f3a0cf77cad232ae6bd0cef9770c35b3bee10d"
    sha256 cellar: :any, x86_64_linux: "9854f5719cb6927ae081a907571a620230a18fc8da3f5702f2900c7f6c77626b"
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
