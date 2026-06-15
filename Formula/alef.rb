# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.14.tar.gz"
  sha256 "c567191ea3fe46f459c0ab67ea31b4ef08ea7938ad93d89a340b79bf7937c017"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.11"
    sha256 cellar: :any, arm64_linux: "928609563cf4dbc2408fe4b356e00f3a94fe459c34a33a2c4ca7ec16d118f885"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6c2e26c09ae3663dfdf17a080d8e938d8d9b9b27e3c664fa9931a64d2631604e"
    sha256 cellar: :any_skip_relocation, sequoia: "7b36944f911214973ed4145eda39ab9b211b731deb06160b1f116d973d151b7d"
    sha256 cellar: :any, x86_64_linux: "e7b9bb1d5d18209932396e833b1a67005272d92f877503150f6f6ef2141ec28b"
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
