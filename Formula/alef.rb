# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.14.tar.gz"
  sha256 "99b7f20c92bfdc0f40ff0c2fb56f64da67297e0221452642857a4d590ed72db4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.13"
    sha256 cellar: :any, arm64_linux: "fea0676387c6a9b9a913cc18340acdbda62789da2db52edc65aeb1524de99154"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3c9fa93763966559f9dbd42d9da27115f4f464f662de2a57fcac43f34f093b9d"
    sha256 cellar: :any, x86_64_linux: "d9364b8113e785103f59c3ce98b6b8b750c5784363253accb0b51eada640d2d0"
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
