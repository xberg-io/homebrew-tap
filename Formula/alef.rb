# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.53.0.tar.gz"
  sha256 "634b6355d8a4b8eac5197d6072472195e165aa86e1336547e6ddbf2c0be53904"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.52.0"
    sha256 cellar: :any, arm64_linux: "631efd9816813061f376cb01bf88956a16774affadca4f8b5edb200c5f356a3d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "02e996a429387c81a835a19c91303d54c4f22c849765a474edc5dcb8245beff5"
    sha256 cellar: :any_skip_relocation, sequoia: "73eb23d00f5caf6a06201f91ff313662b47075f3387dc7bb345c186603e64ddd"
    sha256 cellar: :any, x86_64_linux: "e5dfc801f91c70f11dec2aff979fe274eb34ebf13bc399f5121e210fb93a7070"
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
