# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.55.tar.gz"
  sha256 "de9ef78740d565e94ef1f39bdf3feea238c13f5ad9e440060c6cbb98c35c74ff"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.52"
    sha256 cellar: :any, arm64_linux: "e800f5ccbc0a80acb61f2d6b011bfa7a436e4c87339d2df9255ad0233ee8128b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "42894d89fb3e179de8e6a08f365dc57fb756fdcb55acca2064c5c157b6debb5a"
    sha256 cellar: :any_skip_relocation, sequoia: "a2510b60850a1069455d24d1bcf35713f18856305214c11776ad06f2fe094254"
    sha256 cellar: :any, x86_64_linux: "6ec0798e76a3434c522183bc6a1e43a793b755c44673696e627a60992dcee870"
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
