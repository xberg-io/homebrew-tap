# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.17.tar.gz"
  sha256 "cface893fe1dfb3193de43f44be3a66ef555bec377576cab6bd3e53358dfa644"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.15"
    sha256 cellar: :any, arm64_linux: "c72b69300f13f479612b75e0466cd522d007972acaccf1466eefeaaf6399e0f1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a673def68a0db5636fcf55847f7d354194915c526d9278f84131479f5a6cf08b"
    sha256 cellar: :any, x86_64_linux: "e6486d90373eb1a07ee0875e7b0b4d15f09569e1cee9302ed51ccdead2814785"
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
