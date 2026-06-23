# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.26.6.tar.gz"
  sha256 "6e6b33738af794be6b0c8501188df3016c046ccc2a9dfdc9d76706ff9336cae5"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.26.5"
    sha256 cellar: :any, arm64_linux: "337974676b2abcb8389692897a19774f900d812f0a358a7bbe05557064d6b088"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cd0a306094ace8eb9ca991e42d6ceb9bd786afb903ca3785924da8e79df92229"
    sha256 cellar: :any_skip_relocation, sequoia: "e3ec02afd107708af8c58101e164483773f85bd28e8e809d62984c615ff59d26"
    sha256 cellar: :any, x86_64_linux: "11cba329e864eaaa43cfce214d33ae166e598a0f2808f6347c231ff8d8e69ced"
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
