# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.74.0.tar.gz"
  sha256 "3089be6e60eec39e899a23234fb2346a72c1ac9860b7a49255f96d9a6f8d67d2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.73.0"
    sha256 cellar: :any, arm64_linux: "0df8a11e0526815179a1c28dfc073d26d714aa2310efadeef4d33f0b6872d9dc"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "298d32a5972f3dcc1b57ec0bf38daddb1a6a0edd070c16aff60e119b204b638e"
    sha256 cellar: :any_skip_relocation, sequoia: "5e4ad1f684e2e32b47ddc168879739f6c3a23df877a0d1305dddd02a369faa8b"
    sha256 cellar: :any, x86_64_linux: "644ed33dbe5463dc3fa29da83d8a8973d884881494c10aea872f9b5799662e36"
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
