# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.31.1.tar.gz"
  sha256 "2d85ab761d761ff439250861bb1f0bd421341edf06b207bcbd13399045d73840"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.31.1"
    sha256 cellar: :any, arm64_linux: "518db9fc26543ff976b5d03acf6f8f13dc8582e5db35dd68cb51ae09a73c09c4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c73f510ce68d4e39d5dbbadc3ca938ccf0ac90bbd72ff690f6d133b22cddf961"
    sha256 cellar: :any_skip_relocation, sequoia: "bec476002d4b608941858e5af5f76a91335575eadefe87e2e7cc8598bbd8159f"
    sha256 cellar: :any, x86_64_linux: "1d3a6d76195aaace0b49c3eaf6e36c10aa8fc87634b7b1595da5c136ead3bc25"
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
