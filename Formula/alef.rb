# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.54.1.tar.gz"
  sha256 "36d7d068798e9110353177172324d2d6ef9d4536a93029cfde43065e38e92851"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.54.0"
    sha256 cellar: :any, arm64_linux: "d7cbb675ecd48abebe706be0a161d83028a7270a89d538250f2802c3728c50ee"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1b90b2671af8484a391bcc5cc20e005a0fa2014d2d388d38aaabdf02b018e6f2"
    sha256 cellar: :any_skip_relocation, sequoia: "2381d833a60ee7a7fbace299f13011e059ef5532bd496f32bb080c2abef3a1a0"
    sha256 cellar: :any, x86_64_linux: "e90c133680f0674836544cd5d491b90e99f6640f8d881a883624a4363866e3ef"
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
