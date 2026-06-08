# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.46.tar.gz"
  sha256 "b6420c7e82d6ebaf5ee931f5a62bb4d0995385bd1099c2662eb2eeec98baf1ad"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.44"
    sha256 cellar: :any, arm64_linux: "82e07e26d20df8b6700760d77baa4a69f77f5edc448dd37c99ccc5a364095588"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2936ddd3a3c0bf51d9db9dbdbe8b36469086fd0de8b3e8ca0e85640556e1414e"
    sha256 cellar: :any_skip_relocation, sequoia: "d40be0b173d2e6680b6af62b6c166bbf294d36e94b908166397a490a320fbbe6"
    sha256 cellar: :any, x86_64_linux: "f2b6a812d9927d7a8ad15fbb6c579153b4ff56a055e3a939817b27994f236de0"
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
