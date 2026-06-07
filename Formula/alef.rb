# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.27.tar.gz"
  sha256 "25190a69b05e23215bd016faa82cff19a63ae26ae58a34f023f8ac03049ef833"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.27"
    sha256 cellar: :any, arm64_linux: "5b01a5c9ae3aceaaa29f726796c75d6a64947d2c33b4fc6ba7a504a425dda5d9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8c5ff7a27c6405f12fb89d427a17d2ff9adb6bdcb28faaccc86b805abf4fc6eb"
    sha256 cellar: :any_skip_relocation, sequoia: "ffa3715b5f4ebcb47579369f926d1ba6070228c99736ed0a95b01c3a13f20c46"
    sha256 cellar: :any, x86_64_linux: "8caa7c5026923d2366bfd53c4489cc6c20325ae61677f7ad52a55b2221d05846"
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
