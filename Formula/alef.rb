# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.55.8.tar.gz"
  sha256 "acc1a329a76504e660084e8bfc603e8c60b04447fa657e99198f64a2a39c5ada"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.55.7"
    sha256 cellar: :any, arm64_linux: "cf260e2cd2148c0675d92ce16b50ff352b8e3c6d12c576fa45ebfccb0b1cef8b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "dc6595b59d178173a3714d81fb9b360e7445ff36544075dc63ed66653db70bd7"
    sha256 cellar: :any_skip_relocation, sequoia: "d647eda19dfb17e40ac70ecfbb26117fb77f03d57450f4ffc0038ffd29944772"
    sha256 cellar: :any, x86_64_linux: "c08d55a2d634b981679d9af837f537bdb54582cae09013a95390ba933d70b581"
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
