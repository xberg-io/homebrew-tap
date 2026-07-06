# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.9.tar.gz"
  sha256 "81f00febb93cb85f455d7b2888340b70a04595ca5b3d9d84e84417f8bef75e74"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.7"
    sha256 cellar: :any, arm64_linux: "d0c3d3226503f9a9c2268aa51818045a2bd7ef0922ba9bc266874d34d4501fe6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b18b889797fd9bdfb277063ce68215c2cd6217b408ee6c918831e405e64189c4"
    sha256 cellar: :any_skip_relocation, sequoia: "3dcff5847af97ed3e4fa905688750038b85c428ab907370b6262b2b1224b0309"
    sha256 cellar: :any, x86_64_linux: "ff9c4ffc346729d299316892da58bcdad33f0e2ee9bb6453c222d21f9fc153d3"
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
