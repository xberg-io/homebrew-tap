# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.10.tar.gz"
  sha256 "edeaac8784e752e2daf5593033843eabf2c831690dfddd36b167f047e22ea9a1"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.10"
    sha256 cellar: :any, arm64_linux: "97898ba322929d1f2c966b6fa6f83e2729b6d2ddc0a245396f3f9049ae399a99"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "79df319cb669fe2aab5b2f59dcbe39b374a17a492ce449b4412b10a532ac4dc7"
    sha256 cellar: :any_skip_relocation, sequoia: "c7731d8b10377049933cdab8780f803bf82bf52f7528404256d5a30a1d48c0f7"
    sha256 cellar: :any, x86_64_linux: "7f7474099b5a0ced04899bb556e3478e5e2d5c833baaad3a46fef6df4f913f36"
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
