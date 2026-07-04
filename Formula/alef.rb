# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.31.0.tar.gz"
  sha256 "ba93d12086d80e6a7acaa98266c6cdba178dc7cad35e9599f2508646ba51ac2b"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.19"
    sha256 cellar: :any, arm64_linux: "d540df4b911fc35ac9b6affe53dc8aa99c4d3f2f447dff1f07e7a80080e804bf"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8297844d01c85f9c32f9fcffc1a407ac8ca86f1f10626738e8f2bbbf4fd30ec0"
    sha256 cellar: :any_skip_relocation, sequoia: "747b42c6c6dc95745a6d6316de487b04a9c5c22f873c49cb2f9e21ee0bbd976b"
    sha256 cellar: :any, x86_64_linux: "aaa9f1c89d11395a3b3ab703576d1c79abc3cef74d1695b7ede7171c2837e6e8"
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
