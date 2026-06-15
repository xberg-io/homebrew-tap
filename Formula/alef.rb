# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.16.tar.gz"
  sha256 "2f458f71e8c68f9702ad5043635af9b66681bce434b4b801d8d20a30e66c0e2b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.15"
    sha256 cellar: :any, arm64_linux: "b1d8159ba594e20b407c25b362b093fc195dc576c92d4ee8c1f3c762092c9bc6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8b26e5f9dcb47d8ae08e479ed2b8f98540e413a1c483af22d60e79f30b1ed3a4"
    sha256 cellar: :any_skip_relocation, sequoia: "c2d1d8cb0eb56fa6350a9c3a2c6a87c48ee9ea27bbab477bdf4847fc3158d662"
    sha256 cellar: :any, x86_64_linux: "8207cf453909ebabbb52b1a18c500e86f52d9ac5f33023058fe9efdbc2c42cfb"
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
