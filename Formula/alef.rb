# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.4.tar.gz"
  sha256 "cd0a69469661b67c801a35f8ccfbf39fedfe8dd6a83158ce055188b4253fe70c"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.3"
    sha256 cellar: :any, arm64_linux: "daa33a11b0da2391af8d2b87caefeda01e835c1ea68c88dd03f4193ab17a697a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "28b86507980bcf1d2b1863cc593e5f6a772bb9095810442b9ef9aa835f088dfc"
    sha256 cellar: :any_skip_relocation, sequoia: "af7f95af9e49e7ec871fb69c582411d208034e681a5d46218e7878064e377ad1"
    sha256 cellar: :any, x86_64_linux: "d57a59452988302ce316ccfccb0ebbe8515a47cb98227c2f9bbf4fc352066be0"
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
