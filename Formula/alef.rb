# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.19.tar.gz"
  sha256 "51a8659ff19d9c59d74e6c53d3f2dc32881b114e8333d4ae242451a9dad12e76"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.17"
    sha256 cellar: :any, arm64_linux: "789efde46ed7f5e4b8c4247cafef5f0601c597e8acaf2441d424e3a57e4946dc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6c09f0547ed3bdb135f0c0993bd45a3c284561f198e2ffdfd6ad6a2140bc76cb"
    sha256 cellar: :any_skip_relocation, sequoia: "eb8787c949e8572c4684a93364ecef0702799b1c3a8788f8d3d15bd132d37700"
    sha256 cellar: :any, x86_64_linux: "7b0684602d35d48b1748f20ea66594d9052bc86f6425ae026683c3b25c08d318"
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
