# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.26.tar.gz"
  sha256 "eb141bd676275f8c05214d281676756a512f0ee8beece745781a6ec2bc4b6a00"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.25"
    sha256 cellar: :any, arm64_linux: "7379f6cf0128ead4cb36220648d44502f6b171b637edc362a9e2c9689d4fd6ca"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d53b577d152210c469bf29b8e2972ff46de6ec3a827096496dcec8310b7b5a34"
    sha256 cellar: :any_skip_relocation, sequoia: "3b6873236bd633d1f77c10db89ebf92c4344a3fcc0cfa3b0be0611da1ab2663a"
    sha256 cellar: :any, x86_64_linux: "0368a6b743cbc2dfe094b6ead7e9c252d7735b7a91ee76f5ab96f1cf463fa64f"
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
