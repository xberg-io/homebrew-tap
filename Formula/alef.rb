# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.24.tar.gz"
  sha256 "48999ac3dbe6bcbc9321623f46f39082424e3a5aa5871fe7ffacc3456e8a725d"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.23"
    sha256 cellar: :any, arm64_linux: "4cda9a9dd564db48cfce889c849717dc370bb97e7848a717cae7348cfab4b92c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "55ed777a45b840d973ad7e6e22bef3f2c561622d33cae19c2923a7c26f9801b2"
    sha256 cellar: :any_skip_relocation, sequoia: "72e219684d72caad50fcf0b5c83daa8b996264a96fd42e3571d63921248014cc"
    sha256 cellar: :any, x86_64_linux: "c576e6b802b3d09638bc0658e9bfc9f0a522d0fb4bda904bfa9f8042b205a1fd"
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
