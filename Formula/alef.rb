# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.3.tar.gz"
  sha256 "00323b8d2e1bb431601cc77f9fa41fe356933a33576b877e9fef674b9eab75a8"
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
