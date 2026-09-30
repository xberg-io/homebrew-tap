# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.2.tar.gz"
  sha256 "3d57eb58b944fdfca6ed492d60be7caefb83bf5f3b17c59ea20d17158439a86e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.2"
    sha256 cellar: :any, arm64_linux: "d421866ce7071b2a2414c437dbf75d0238a5b468ddfbe3073f1f46207e6a08cf"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "475a935e20394a4e62ff47d33e579bcdfdeff7433c514c715af860d931b825aa"
    sha256 cellar: :any, x86_64_linux: "c938fc50e2907434d973d28dc2a1fc28834ea999dcfcd45569462a17e9ba0e6e"
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
