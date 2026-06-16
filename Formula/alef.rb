# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.23.tar.gz"
  sha256 "f21ebfd801bd5bec30d76be3c1b95e3c4e9f8f5c6abd4311b505658ccf3cbbbd"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.21"
    sha256 cellar: :any, arm64_linux: "b431357bc67fd48d371ca842fb3ac279105ceb9a827d6597bb76b70b3baa9210"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c606812e25fea109060af93c8fc39243759bff40a39193d40bfc567cfd03926e"
    sha256 cellar: :any_skip_relocation, sequoia: "91d0654f050b4e815cbe8d99597ed756e993806a696d72777b6beeeb28c58b3f"
    sha256 cellar: :any, x86_64_linux: "b5ded29e48988f12c60913b8d04747d150365a3aa7aa31572e1085e92438ad58"
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
