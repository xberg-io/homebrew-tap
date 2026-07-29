# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.6.tar.gz"
  sha256 "bf26c8f0e67288ea54e93d9662d973f38e928a2b763ff4c88f462a744bd81d7c"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.5"
    sha256 cellar: :any, arm64_linux: "e68008196a2f77522f66645dbf886fce986be5a36b07ebeb4b9dea195aeec0a7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0eed72145d26aff446f10e65f39c4c5ccb6dcc7306434d1acf1a6c8fa07f0b30"
    sha256 cellar: :any_skip_relocation, sequoia: "b5a60f931de5fd4453991587a502e610db11fb16ecf6def1030a74e18bc73e33"
    sha256 cellar: :any, x86_64_linux: "51b11c84b3b7196704289f437fc21e5b1a1490dc3d3575a81c87cdcc0e6ba620"
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
