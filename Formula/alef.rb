# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.5.tar.gz"
  sha256 "d27255c73067d0ed8405afdd8b3f9247ca7e1080571095fe50161ca3d17afc85"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.4"
    sha256 cellar: :any, arm64_linux: "5240ea30c96a7ad3a38576e808784269f88094e9877de2866b1716f5839b8fd8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "190b9a5b7fad47dcef720eb39d520318ed2d7f74ca2e109d8acd132c0be954b6"
    sha256 cellar: :any_skip_relocation, sequoia: "473343c36c3a07287eaeffd8002c83d2df47b658fa6f66fd7ba11ae6af808af8"
    sha256 cellar: :any, x86_64_linux: "9714963f4865e9a81019b41325ad5ab38836b4a2eb42c6b4a8195ba7435127b4"
  end

  head "https://github.com/xberg-io/alef.git", branch: "main"

  depends_on "rust" => :build

  def install
    system("cargo", "install", *std_cargo_args)
  end

  test do
    system "#{bin}/alef", "--help"
  end
end
