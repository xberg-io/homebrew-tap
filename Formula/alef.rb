# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.11.tar.gz"
  sha256 "0f04dbad788318681926cf2e04ba0fd459079c9d1720d4742733d860de23cddc"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.10"
    sha256 cellar: :any, arm64_linux: "1b707536e6e6dc40b0475248b68342837c58f536579d282171641b9ecafac845"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "bafaa8a3bc118c5b004a190529bd8a285269a17ffea5a49142c1c6ca4f04abe3"
    sha256 cellar: :any_skip_relocation, sequoia: "d69dab7c5f9bff8c0e93a138c9617cbed9b89c5d0410467de143f3649641adb7"
    sha256 cellar: :any, x86_64_linux: "eec40d8f75dff8ca7a7abc9bbb340e819a9c2a66516287b8789d030bb3d4f697"
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
