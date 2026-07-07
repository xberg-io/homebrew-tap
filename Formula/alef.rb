# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.11.tar.gz"
  sha256 "ce0ec60b450f5bcd25dabf407bb95237289eda4bf17404cecf99b189ca8a1ed2"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.10"
    sha256 cellar: :any, arm64_linux: "efb15074c10dcdcc6ca079a69ef09d0e70e47100e6e6d9b1e3ac19c23da29dda"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9b1270b4ce59afc886793f1dd6e39b239f43d1f91c38a96afebd5ba5f92a8410"
    sha256 cellar: :any_skip_relocation, sequoia: "6b241ee7ceda903afd9cae01adf8dca4eefbd9171a935b4c150befcf1245a4f0"
    sha256 cellar: :any, x86_64_linux: "09bfbcc51c095d11ea7606e1694732f32c3b8f10777ec3057aec858aa0cb4cd5"
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
