# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.105.0.tar.gz"
  sha256 "91f66b2274d8ea39254f043fa1956f87f1773a00c6c1a94a3124933fdeebfd93"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.104.4"
    sha256 cellar: :any, arm64_linux: "dc0cf2d03cc52319e843a38a2c538085d4f145616253369a01b3333b229ef826"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "58d67fed6837a723a75d5704fcab17e6d802826ee4bf9f3a82a78334355f3291"
    sha256 cellar: :any, x86_64_linux: "99b05e7d4f50150ebaf1ee278bdc52b0245c19120ef449705209dedfc35d6ff2"
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
