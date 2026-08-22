# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.12.tar.gz"
  sha256 "4a46f1afa1407e759ffce6bcb69f8cf5502866a99b52d1519826093bd578524d"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.11"
    sha256 cellar: :any, arm64_linux: "bcfbc8badb291d9de05e60bfa659754950c93ba5045d8ea29fce8a70587f52de"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "db9e951b35ca7c257dbcbc19c23be2d1a7851ac0f4047987c1758ab7f14b7b5f"
    sha256 cellar: :any_skip_relocation, sequoia: "92982cc1798d7b4d3d94d70b64dba6289f0a21efab7271d415055aecd8a8478f"
    sha256 cellar: :any, x86_64_linux: "605be54260de7583213cc2cc082890391eeb85c55f5dc001bd6cb02815a79f75"
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
