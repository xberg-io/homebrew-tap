# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.0.tar.gz"
  sha256 "9c7da89b15a043971786a560e85f6e4c20b235a3d0f69f95ceeb277a75d22a88"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.31.2"
    sha256 cellar: :any, arm64_linux: "95e7ef69d91a6aa982ba76b372940cdee41375c67f1b590882a3982356595234"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9dab261e853d10c89f33949b9b9e1aa8e5c507f967d7efd05cab58c430ba9108"
    sha256 cellar: :any_skip_relocation, sequoia: "964c07344110f4f05615b1827401799ce7f6440e30bda31e27955a52064ce6f4"
    sha256 cellar: :any, x86_64_linux: "e23de0fa441e07909a1a4dc96d02d2ad6439d7229d2531070f1b53460623918f"
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
